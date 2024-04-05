from flask import *
from database import *
import uuid
# from comparison import *

public=Blueprint('public',__name__)

@public.route('/')
def homepage():
	# q="select * from login"
	# res=select(q)
	# print(res)
	# print(type(res))
	return render_template('homepage.html')

@public.route('/login',methods=['get','post'])
def login():

	if 'submit' in request.form:
		uname=request.form['uname']
		passs=request.form['pwd']
		q="SELECT * FROM `login` WHERE username='%s' AND `password`='%s'"%(uname,passs)
		res=select(q)
		if res:
			session['lid']=res[0]['login_id']
			if res[0]['user_type']=='admin':
				flash('WELCOME TO ADMIN HOME')
				return redirect(url_for('admin.adminhome'))
			if res[0]['user_type']=='hospital':
				q="SELECT * FROM hospitals WHERE `login_id`='%s'"%(res[0]['login_id'])
				res2=select(q)
				session['hid']=res2[0]['hospital_id']
				session
				flash('WELCOME TO HOSPITAL HOME')
				return redirect(url_for('hospital.hospitalhome'))
				
			if res[0]['user_type']=='doctor':
				q="SELECT * FROM doctor WHERE `login_id`='%s'"%(res[0]['login_id'])
				res2=select(q)
				session['did']=res2[0]['doctor_id']
				flash('WELCOME TO DOCTOR HOME')
				return	redirect(url_for('doctor.doctor_home'))

			if res[0]['user_type']=='patient':
				q="SELECT * FROM patients WHERE `login_id`='%s'"%(res[0]['login_id'])
				rr=select(q)
				session['pid']=rr[0]['patient_id']
				flash('WELCOME TO PATIENT HOME')
				return	redirect(url_for('patient.patient_home'))

			if res[0]['user_type']=='pharmacy':
				q="SELECT * FROM pharmacy WHERE `login_id`='%s'"%(res[0]['login_id'])
				rr=select(q)
				session['phid']=rr[0]['pharmacy_id']
				flash('WELCOME TO PHARMACY HOME')
				return	redirect(url_for('pharmacy.pharmacyhome'))
		else:
			flash("Username Or password Is Wrong")
	return render_template('login.html')

@public.route('/registration',methods=['get','post'])
def registration():

	if 'submit' in request.form:
		uname=request.form['Username']
		pword=request.form['password']
		hname=request.form['Hospitalname']
		place=request.form['Place']
		landmark=request.form['landmark']
		latitiude=request.form['latitude']
		longitude=request.form['longitude']
		phone=request.form['phone']
		email=request.form['email']
		photo=request.files['photo']
		path="static/images/"+str(uuid.uuid4())+photo.filename
		photo.save(path)

		q="INSERT INTO `login`(`username`,`password`,`user_type`)VALUES('%s','%s','pending')"%(uname,pword)
		id=insert(q)
		q1="INSERT INTO  hospitals VALUES(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','pending')"%(id,hname,place,landmark,latitiude,longitude,phone,email,path)
		insert(q1)
		flash("REGISTERED")
		return redirect(url_for('public.login'))
	return render_template('registration.html')




@public.route('/patient_registration',methods=['get','post'])
def patient_registration():
	if 'submit' in request.form:
		uname=request.form['un']
		pword=request.form['pw']
		fn=request.form['fn']
		ln=request.form['ln']
		place=request.form['Place']
		dob=request.form['dob']
		gen=request.form['gen']
		phone=request.form['phone']
		email=request.form['email']

		q="INSERT INTO `login`(`username`,`password`,`user_type`)VALUES('%s','%s','patient')"%(uname,pword)
		id=insert(q)
		q1="INSERT INTO  patients VALUES(null,'%s','%s','%s','%s','%s','%s','%s','%s')"%(id,fn,ln,dob,gen,place,phone,email)
		insert(q1)
		flash("REGISTERED")
		return redirect(url_for('public.login'))
	return render_template('patient_registration.html')


@public.route('/pharmacy_registration',methods=['get','post'])
def pharmacy_registration():

	if 'submit' in request.form:
		uname=request.form['Username']
		pword=request.form['password']
		hname=request.form['pname']
		place=request.form['Place']
		landmark=request.form['landmark']
		phone=request.form['phone']
		email=request.form['email']

		q="INSERT INTO `login`(`username`,`password`,`user_type`)VALUES('%s','%s','pharmacy')"%(uname,pword)
		id=insert(q)
		t="insert into pharmacy values(null,'%s','%s','%s','%s','%s','%s')"%(id,uname,place,landmark,phone,email)
		insert(t)
		flash("REGISTERED..........")
		return redirect(url_for('public.login'))
	return render_template('pharmacy_reg.html')



