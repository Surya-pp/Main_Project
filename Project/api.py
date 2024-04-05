from flask import *
from database import *

import demjson
import uuid
# import base64
# import randomforest as rf
# from newrsa import *



import smtplib      
from email.mime.text import MIMEText
from flask_mail import Mail

# import DataDuplication as dd
# from core import *

api=Blueprint('api',__name__)

@api.route('/getnumber')
def getnumber():
	data={}
	# lid=request.args['lid']
	# lati=request.args['lati']
	# longi=request.args['longi']
	# q="select * from contacts where women_id=(select women_id from women where log_id='%s')"%(lid)
	q="select * from hospitals "
	print(q)
	res=select(q)
	# q1="SELECT *,(3959 * ACOS ( COS ( RADIANS('%s') ) * COS( RADIANS( latitude) ) * COS( RADIANS( longitude ) - RADIANS('%s') ) + SIN ( RADIANS('%s') ) * SIN( RADIANS( latitude ) ))) AS user_distance FROM zone_officer HAVING user_distance <40 ORDER BY user_distance ASC " %(lati,longi,lati)
	# res1=select(q1)
	if res:
		data['status']="success"
		data['phone']=res[0]['phone']
	else:
		data['status']="failed"
	data['method']="getnumber"
	return str(data)

@api.route('/login',methods=['get','post'])
def login():
    data={}
    
    username = request.args['username']
    password = request.args['password']
    q="SELECT * from login where username='%s' and password='%s'" % (username,password)
    res = select(q)
    print(res)
    if res :
        q="SELECT * from patients where login_id='%s' " % (res[0]['login_id'])
        res1 = select(q)
        print(res1)
        if res1:
            data['status']  = 'success'
            data['data'] = res
            data['phone'] = res1[0]['phone']
        else:
            data['status']='failed'
    else:
        data['status']  = 'failed'
    data['method']='login'
    return  demjson.encode(data)


@api.route('/userregister',methods=['get','post'])
def userregister():

    data = {}

    fname=request.args['fname']
    lname=request.args['lname']
    
    place=request.args['place']
    phone=request.args['phone']
    mail=request.args['email']
    dob=request.args['dob']
    gender=request.args['gender']
    uname=request.args['uname']
    passw=request.args['pass']

    q="insert into login values(null,'%s','%s','patient')"%(uname,passw)
    id=insert(q)

    q="insert into patients values(null,'%s','%s','%s','%s','%s','%s','%s','%s')" %(id,fname,lname,dob,gender,place,phone,mail)
    insert(q)
    data['status']='success'
    data['method']='userregister'
    
    return demjson.encode(data)


@api.route('/Viewhospitals',methods=['get','post'])
def Viewhospitals():
    data={}  
    q="SELECT * from hospitals"
    res = select(q)
    print(res)

    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='Viewhospitals'
    return  demjson.encode(data)

# @api.route('/Viewdept',methods=['get','post'])
# def Viewdept():
#     data={}
    
#     hid=request.args['hid']
#     q="SELECT * from departments where hospital_id='%s'" %(hid)
#     res = select(q)
#     print(res)
#     if res :
#         data['status']  = 'success'
#         data['data'] = res
        
#     else:
#         data['status']  = 'failed'
#     data['method']='Viewdept'
#     return  demjson.encode(data)

@api.route('/Viewdoctors',methods=['get','post'])
def Viewdoctors():
    data={}
    
    q="SELECT *,concat(first_name,' ',last_name) as dname from doctor"
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res    
    else:
        data['status']  = 'failed'
    data['method']='Viewdoctors'
    return  demjson.encode(data)


@api.route('/makeappointment',methods=['get','post'])
def makeappointment():

    data = {}

    did=request.args['did']
    date=request.args['date']
    lid=request.args['lid']


    q="insert into appointments values(null,'%s',(select patient_id from patients where login_id='%s'),'%s',curdate(),'pending','0')" %(did,lid,date)
    insert(q)
    data['status']='success'
    data['method']='makeappointment'
    
    return demjson.encode(data)

@api.route('/viewbloodcamp',methods=['get','post'])
def viewbloodcamp():

    data = {}

    q="select * from blooddonation"
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='viewbloodcamp'
    return  demjson.encode(data)


@api.route('/viewappointment',methods=['get','post'])
def viewappointment():
    data={}
    
    lid=request.args['lid']
    q="SELECT *,concat(first_name,' ',last_name) as doctors from appointments inner join doctor using(doctor_id) where patient_id=(select patient_id from patients where login_id='%s')" %(lid)
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='viewappointment'
    return  demjson.encode(data)


@api.route('/medicaldetails/',methods=['get','post'])
def medicaldetails():

    data = {}
    data['status']="success"
    data['method']='medicaldetails'
    image=request.files['image']
    lid=request.form['lid']
    q="select * from patients where login_id='%s'" %(lid)
    res=select(q)
    print(res,"=================")


    path="static/uploads/"+str(uuid.uuid4())+image.filename
    image.save(path)


        # dd.upload (data, image.filename,res[0]['patient_id'],'0')
    # file,val,keys=encrypt(path)
    q="INSERT INTO `medical_records`VALUES(NULL,'%s','0','doctor','%s',NOW())"%(res[0]['patient_id'],path)

    id=insert(q)
    
    # email=res[0]['email']
    # try:
    #     gmail = smtplib.SMTP('smtp.gmail.com', 587)

    #     gmail.ehlo()

    #     gmail.starttls()

    #     gmail.login('projectsriss2020@gmail.com','messageforall')

    # except Exception as e:
    #     print("Couldn't setup email!!"+str(e))

    # msg = MIMEText("The key for the uploaded content is: "+keys)
    
    # msg['Subject'] = 'Your Username and Password'

    # msg['To'] = email

    # msg['From'] = 'projectsriss2020@gmail.com'

    # try:

    #     gmail.send_message(msg)
    #     print(msg)
    #     print(email)
    #     flash('ASSIGNED SUCCESS..')
            

    # except Exception as e:

    #     print("COULDN'T SEND EMAIL", str(e))
    #     flash("Something Went Wrong...")
    
    return demjson.encode(data)



@api.route('/Viewrequestedforreports',methods=['get','post'])
def Viewrequestedforreports():
    data={}
    
    lid=request.args['login_id']
    q="SELECT *,concat(first_name,' ',last_name) as doctors from requests inner join doctor using(doctor_id) where  medical_record_id IN (select medical_record_id from medical_records where patient_id=(select patient_id from patients where login_id='%s'))" %(lid)
    
    print(q)
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='Viewrequestedforreports'
    return  demjson.encode(data)


@api.route('/requestaccepted',methods=['get','post'])
def requestaccepted():

    data = {}

    mid=request.args['mid']
    did=request.args['did']
    rid=request.args['rid']


    q="insert into shared values(null,'%s','%s')" %(mid,did)
    insert(q)
    q="update requests set status='Accepted' where request_id='%s'" %(rid)
    update(q)
    data['status']='success'
    data['method']='requestaccepted'
    
    return demjson.encode(data)

@api.route('/requestremoved',methods=['get','post'])
def requestremoved():

    data = {}

    rid=request.args['rid']

    q="update requests set status='Rejected' where request_id='%s'" %(rid)
    update(q)
    data['status']='success'
    data['method']='requestremoved'
    
    return demjson.encode(data)

@api.route('/chatdetail',methods=['get','post'])
def chatdetail():

    data = {}

    sender_id=request.args['sender_id']
    receiver_id=request.args['receiver_id']

    q="select * from  messages where (sender_id='%s' and receiver_id='%s') or (sender_id='%s' and receiver_id='%s')" %(sender_id,receiver_id,receiver_id,sender_id)
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='chatdetail'
    
    return demjson.encode(data)

@api.route('/chat',methods=['get','post'])
def chat():

    data = {}

    sender_id=request.args['sender_id']
    receiver_id=request.args['receiver_id']
    messages=request.args['details']

    q="insert into messages values(null,'%s','','%s','','%s',curdate())" %(sender_id,receiver_id,messages)
    insert(q)
    data['status']='success'
    data['method']='chat'
    
    return demjson.encode(data)

@api.route('/usersendfeedback',methods=['get','post'])
def usersendfeedback():

    data = {}

    lid=request.args['lid']
    feed_des=request.args['feed_des']

    q="insert into complaints values(null,(select patient_id from patients where login_id='%s'),'%s','pending',curdate())" %(lid,feed_des)
    insert(q)
    data['status']='success'
    data['method']='usersendfeedback'
    
    return demjson.encode(data)



@api.route('/userviewdoctors',methods=['get','post'])
def userviewdoctors():

    data = {}

    login_id=request.args['login_id']

    q="SELECT *,concat(first_name,' ',last_name) as doctor FROM doctor WHERE login_id IN(SELECT IF(sender_id='%s',receiver_id,sender_id) FROM messages WHERE sender_id='%s' OR receiver_id='%s')" %(login_id,login_id,login_id)
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='userviewdoctors'
    
    return demjson.encode(data)

@api.route('/userviewfeedback',methods=['get','post'])
def userviewfeedback():

    data = {}

    login_id=request.args['lid']

    q="SELECT * from complaints where patient_id=(select patient_id from patients where login_id='%s')" %(login_id)
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='userviewfeedback'
    
    return demjson.encode(data)

@api.route('/Viewdisease',methods=['get','post'])
def Viewdisease():

    data = {}
    q="SELECT * from diseases"
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='Viewdisease'
    
    return demjson.encode(data)

@api.route('/viewmedical',methods=['get','post'])
def viewmedical():

    data = {}
    lid=request.args['lid']
    q="""SELECT `medical_record_id`,`patient_id`,`medical_records`.`doctor_id`,`uploaded_by`,`file`,`date_time`,`key`,concat(`first_name`," ",`last_name`)as names from `medical_records` INNER JOIN `doctor` ON `medical_records`.`doctor_id`=`doctor`.`doctor_id` WHERE uploaded_by='doctor' and patient_id=(select patient_id from patients where login_id='%s') 
UNION
SELECT `medical_record_id`,`patient_id`,`medical_records`.`doctor_id`,`uploaded_by`,`file`,`date_time`,`key`,concat(`first_name`," ",`last_name`)as names FROM  `medical_records`  INNER JOIN `patients` USING(patient_id) WHERE uploaded_by='patient' and  patient_id=(select patient_id from patients where login_id='%s')"""  %(lid,lid)
    
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='viewmedical'
    
    return demjson.encode(data)



@api.route('/downloadfile',methods=['get','post'])
def downloadfile():

    datas = {}

    mid = request.args['mid']
    path=decrypt(mid)
    # data = download(mid)
    print("path : "+path[::-1])

    filename="static/downloads/"+str(uuid.uuid4())+path[:-1]
    fh1 = open(filename, "wb")
    fh1.write(base64.b64decode(data))
    fh1.close()

    datas['status']='success'
    datas['path']=filename
    datas['method']='downloadfile'
    
    return demjson.encode(datas)


@api.route('/Review',methods=['get','post'])
def Review():
    data={}
    login_id=request.args['login_id']
    doct_id=request.args['doct_id']
    rate=request.args['rating']
    review=request.args['review']
    print(review)

    q="select * from patients where login_id='%s'"%(login_id)
    res=select(q)
    q="select * from rating where patient_id='%s' and doctor_id='%s'"%(res[0]['patient_id'],doct_id)
    res1=select(q)
    if res1:
        q="update rating set rate='%s', review='%s' where rating_id='%s'"%(rate,review,res1[0]['rating_id'])
        id=update(q)
    else:
        q="insert into rating values(NULL,'%s','%s','%s','%s')"%(res[0]['patient_id'],rate,doct_id,review)
        id=insert(q)
    if id:
        data['status']="success"
        data['method']="Review"
        data['data']=id
        
    else:
        data['status']="failed"
        data['method']="Review"
    return demjson.encode(data)



@api.route('/ViewReview',methods=['get','post'])
def ViewReview():
    data={}
    login_id=request.args['login_id']
    doct_id=request.args['doct_id']
    q="select * from patients where login_id='%s'"%(login_id)
    res=select(q)
    q="select * from rating inner join doctor using(doctor_id) where doctor_id='%s' and patient_id='%s' "%(doct_id,res[0]['patient_id'])
    res=select(q)
    if res:
        data['status']="success"
        data['method']="ViewReview"
        data['data']=res[0]['rate']
    
        
    else:
        data['status']="failed"
        data['method']="ViewReview"
    return demjson.encode(data)







@api.route('/Viewpriscrption',methods=['get','post'])
def Viewpriscrption():

    data = {}
    aids=request.args['aids']
    q="SELECT * from prescription where appointment_id='%s'"%(aids)
    res=select(q)
    print (aids,'yyyyyyyyyyyyyy')
    data['status']='success'
    data['data']=res
    data['method']='Viewpriscrption'
    
    return demjson.encode(data)





@api.route('/payment',methods=['get','post'])
def payment():
    data={}
    aids=request.args['appoint_id']
    amounts=request.args['amounts']
    q="insert into payment values(null,'%s','%s','doctorfee',curdate())"%(aids,amounts)
    insert(q)
    e="update appointments set status='paid' where appointment_id='%s'"%(aids)
    update(e)
    data['status']='success'
    data['method']='payment'
    
    return demjson.encode(data)

   

@api.route('/Viewdocandschedule')
def Viewdocandschedule():
    data={}
    hid=request.args['hid']
    q="SELECT *,concat(first_name,' ',last_name) as dname from doctor where hospital_id='%s'"%(hid)
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res    
    else:
        data['status']  = 'failed'
    data['method']='Viewdocandschedule'
    return  demjson.encode(data)
 


@api.route('/Viewsymptoms',methods=['get','post'])
def Viewsymptoms():

    data = {}
    q="SELECT * from diseases inner join symtoms using(disease_id)"
    res=select(q)
    data['status']='success'
    data['data']=res
    data['method']='Viewsymptoms'
    
    return demjson.encode(data)


def findval(s):
    # print("=====================",s)
    if s=="Yes":
        out=1
    else:
        out=0
    return out

@api.route('/Predict',methods=['get','post'])
def Predict():

    data = {}
    s1a=request.args['s1']
    s1=findval(s1a)
    # print("======================================",str(s1))
    s2a=request.args['s2'] 
    s2=findval(s2a)
    s3a=request.args['s3']
    s3=findval(s3a)
    s4a=request.args['s4']
    s4=findval(s4a)
    s5a=request.args['s5']
    s5=findval(s5a)
    s6a=request.args['s6']
    s6=findval(s6a)
    s7a=request.args['s7']
    s7=findval(s7a)
    s8a=request.args['s8']
    s8=findval(s8a)
    s9a=request.args['s9']
    s9=findval(s9a)
    s10a=request.args['s10']
    s10=findval(s10a)
    s11a=request.args['s11']
    s11=findval(s11a)
    s12a=request.args['s12']
    s12=findval(s12a)
    s13a=request.args['s13']
    s13=findval(s13a)
    s14a=request.args['s14']
    s14=findval(s14a)
    s15a=request.args['s15']
    s15=findval(s15a)
    s16a=request.args['s16']
    s16=findval(s16a)
    s17a=request.args['s17']
    s17=findval(s17a)
    s18a=request.args['s18']
    s18=findval(s18a)
    s19a=request.args['s19']
    s19=findval(s19a)
    s20a=request.args['s20']
    s20=findval(s20a)
    s21a=request.args['s21']
    s21=findval(s21a)
    s22a=request.args['s22']
    s22=findval(s22a)
    s23a=request.args['s23']
    s23=findval(s23a)
    s24a=request.args['s24']
    s24=findval(s24a)
    s25a=request.args['s25']
    s25=findval(s25a)
    s26a=request.args['s26']
    s26=findval(s26a)
    s27a=request.args['s27']
    s27=findval(s27a)
    s28a=request.args['s28']
    s28=findval(s28a)
    s29a=request.args['s29']
    s29=findval(s29a)
    s30a=request.args['s30']
    s30=findval(s30a)
    s31a=request.args['s31']
    s31=findval(s31a)
    s32a=request.args['s32']
    s32=findval(s32a)
    s33a=request.args['s33']
    s33=findval(s33a)
    s34a=request.args['s34']
    s34=findval(s34a)
    s35a=request.args['s35']
    s35=findval(s35a)
    s36a=request.args['s36']
    s36=findval(s36a)
    s37a=request.args['s37']
    s37=findval(s37a)
    s38a=request.args['s38']
    s38=findval(s38a)
    s39a=request.args['s39']
    s39=findval(s39a)
    s40a=request.args['s40']
    s40=findval(s40a)
    s41a=request.args['s41']
    s41=findval(s41a)
    

    print(([float(s1),float(s2),float(s3),
            float(s4),float(s5),float(s6),float(s7),float(s8),
            float(s9),float(s10),float(s11),float(s12),float(s13),
            float(s14),float(s15),float(s16),float(s17),float(s18),
            float(s19),float(s20),float(s21),float(s22),float(s23)
            ,float(s24),float(s25),float(s26),float(s27),
                float(s28),float(s29),float(s30),float(s31),
            float(s32),float(s33),float(s34),float(s35),
            float(s36),float(s37),float(s38),float(s39),float(s40)
            ,float(s41)
            ]))
    result=rf.predict_me([float(s1),float(s2),float(s3),
            float(s4),float(s5),float(s6),float(s7),float(s8),
            float(s9),float(s10),float(s11),float(s12),float(s13),
            float(s14),float(s15),float(s16),float(s17),float(s18),
            float(s19),float(s20),float(s21),float(s22),float(s23)
            ,float(s24),float(s25),float(s26),float(s27),
                float(s28),float(s29),float(s30),float(s31),
            float(s32),float(s33),float(s34),float(s35),
            float(s36),float(s37),float(s38),float(s39),float(s40)
            ,float(s41)
            ])

    print(result)
    # return str(result)
    data['status']='success'
    data['method']='Predict'
    data['out']=result[0]
    
    return str(data)





@api.route('/Viewlab',methods=['get','post'])
def Viewlab():

    data = {}

    q="select * from lab"
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='Viewlab'
    return  demjson.encode(data)

@api.route('/ViewAmbulance',methods=['get','post'])
def ViewAmbulance():

    data = {}

    q="select * from ambulance"
    res = select(q)
    print(res)
    if res :
        data['status']  = 'success'
        data['data'] = res
        
    else:
        data['status']  = 'failed'
    data['method']='ViewAmbulance'
    return  demjson.encode(data)




# @api.route('/request',methods=['post'])
# def request():
    
#     login_id=request.form['login_id']
#     e="select * from pharmacy where login_id='%s'"%(login_id)
#     res=select(e)
    # if res:
    #     user_id=res[0]['user_id']
    #     print("mmmmmmmmmmmm",user_id)
    # cid=request.form['cid']
    # print("iiiiiiiiiiiii",cid)
    # sid=request.form['sid']
    # print("iiiiiiiiiiiii",sid)
    # r="insert into request values(null,'%s','%s','%s')"%(user_id,cid,sid)
    # res=insert(r)
    # if res :
    #     data['status']  = 'success'
    #     data['data'] = res
        
    # else:
    #     data['status']  = 'failed'
    # data['method']='request'

    # return  demjson.encode(data)


@api.route("/viewpharmacy")
def viewpharmacy():
    data={}
    
    q="select * from pharmacy"
    res=select(q)

    if res:
        data['status']="success"
        data['data']=res
        data['method']='viewpharmacy'
    else:
        data['status']="failed"
        data['method']='viewpharmacy'
    return str(data)


@api.route("/uploadrequest")
def uploadrequest():
    data={}
    pids=request.args['pids']
    l_id=request.args['l_id']
    pid=request.args['pid']

    q="insert into request1 values(null,'%s','%s','0',curdate(),'pending')"%(pids,pid)
    res=insert(q)

    if res:
        data['status']="success"
        data['data']=res
        data['method']='uploadrequest'
    else:
        data['status']="failed"
        data['method']='uploadrequest'
    return str(data)


@api.route("/Viewrequest")
def Viewrequest():
    data={}
    l_id=request.args['l_id']
    q="SELECT *,`request1`.amount AS amt FROM `request1` INNER JOIN `prescription` USING(`prescription_id`) INNER JOIN `appointments` USING(`appointment_id`) WHERE patient_id=(select patient_id from patients where login_id='%s')"%(l_id)
    res=select(q)


    if res:
        data['status']="success"
        data['data']=res
        data['method']='Viewrequest'
    else:
        data['status']="failed"
        data['method']='Viewrequest'
    return str(data)




@api.route('/Mpayment',methods=['get','post'])
def Mpayment():
    data={}
    rids=request.args['request_id']
    aids=request.args['appoint_id']
    amounts=request.args['amounts']
    print(amounts)
    q="insert into payment values(null,'%s','%s','pharmacyfee',curdate())"%(aids,amounts)
    insert(q)
    e="update request1 set status='paid' where request_id='%s'"%(rids)
    update(e)
    data['status']='success'
    data['method']='Mpayment'
    
    return demjson.encode(data)