from flask import *
from database import *
import uuid

hospital=Blueprint('hospital',__name__)

@hospital.route('/hospitalhome')
def hospitalhome():
	return render_template('hospitalhome.html')

#@hospital.route('/hospitals_view_patients')
def hospitals_view_patients():

	data={}

	q="SELECT * FROM `patients` "
	res=select(q)
	data['patients']=res

	return render_template('hospitals_view_patients.html',data=data)

#@hospital.route('/hospitals_view_appointment')
def hospitals_view_appointment():
	data={}
	q="SELECT *,CONCAT(`patients`.`first_name`,' ',`patients`.`last_name`) AS patient_name,CONCAT(`doctor`.`first_name`,' ',`doctor`.`last_name`) AS doctor_name FROM `appointments` INNER JOIN `doctor` USING (doctor_id) INNER JOIN patients USING(patient_id) WHERE  hospital_id='%s'"%(session['hid'])
	res=select(q)
	data['appoinment']=res
	if 'action' in request.args:
		action=request.args['action']
		appointment_id=request.args['appointment_id']
		if action=='accept':
			q="update appointments set status='appointed' where appointment_id='%s'"%(appointment_id)
			update(q)
			print(q)
			flash("Appointed succesfully")
			return redirect(url_for('hospital.hospitals_view_appointment'))

		if action=='reject':
			q="update appointments set status='cancelled' where appointment_id='%s'"%(appointment_id)
			update(q)
			flash("Rejected succesfully")
			return redirect(url_for('hospital.hospitals_view_appointment'))

	return render_template('hospitals_view_appointment.html',data=data)

@hospital.route('/hospital_manage_departments',methods=['get','post'])
def hospital_manage_departments():
	data={}	
	hid=session['hid']	
	q="SELECT * FROM `departments` WHERE `hospital_id`='%s'"%(hid)
	data['department']=select(q)
	if 'submit' in request.form:
		dname=request.form['dname']
		q="INSERT INTO `departments`(`hospital_id`,`department_name`)VALUES('%s','%s')"%(session['hid'],dname)
		insert(q)
		flash("ADDED")
		return redirect(url_for('hospital.hospital_manage_departments'))
	return render_template('hospital_manage_departments.html',data=data)


@hospital.route('/hospital_managedoctors',methods=['get','post'])
def hospital_managedoctors():

	data={}
	w="select * from departments where hospital_id='%s'"%(session['hid'])
	data['ww']=select(w)
	q="SELECT * FROM `doctor` where hospital_id='%s'"%(session['hid'])  
	res=select(q)
	data['doctors']=res

	q="SELECT * FROM `departments` where hospital_id='%s'"%(session['hid'])
	res=select(q)
	data['dept']=res

	if 'submit' in request.form:
		uname=request.form['uname']
		passs=request.form['pword']
		fname=request.form['fname']
		lname=request.form['lname']
		place=request.form['place']
		phone=request.form['phone']
		email=request.form['email']
		quali=request.form['qualification']
		photo=request.files['photo']
		dep=request.form['dep']
		path="static/images/"+str(uuid.uuid4())+photo.filename
		photo.save(path)

		q="INSERT INTO login(`username`,`password`,`user_type`)VALUES('%s','%s','doctor')"%(uname,passs)
		id=insert(q)
		q1="INSERT INTO `doctor` VALUES(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(id,session['hid'],fname,lname,place,phone,email,path,quali)
		insert(q1)
		flash("REGISTERED")
		return redirect(url_for('hospital.hospital_managedoctors'))
	
	if 'action' in request.args:
		action=request.args['action']
		did=request.args['did']
		lid=request.args['lid']
	else:
		action=None
	if action == 'delete':
		pass
		q="delete from doctor where doctor_id='%s'"%(did)
		delete(q)
		w="delete from login where login_id='%s'"%(lid)
		delete(w)
		flash("DELETED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_managedoctors'))
	if action == 'update':
		e="select * from doctor where doctor_id='%s'"%(did)
		data['up']=select(e)
	if 'update' in request.form: 
		fname=request.form['fname']
		lname=request.form['lname']
		place=request.form['place']
		phone=request.form['phone']
		email=request.form['email']
		quali=request.form['qualification']
		dep=request.form['dep']
		q="update doctor set first_name='%s',last_name='%s',place='%s',phone='%s',email='%s',qualification='%s',department='%s' where doctor_id='%s'"%(fname,lname,place,phone,email,quali,dep,did)
		update(q)
		flash("UPDATED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_managedoctors'))
	return render_template('hospitals_managedoctors.html',data=data)


@hospital.route('/hospital_view_rating')
def hospital_view_rating():

	data={}
	did=request.args['did']
	q="SELECT * FROM `rating` inner join patients using(patient_id) where doctor_id='%s'"%(did)
	print("llllllllllllllll",q)
	res=select(q)
	data['rate']=res
	# print(data['rate'])
	return render_template('hospital_view_rating.html',data=data)



@hospital.route('/hospital_manage_shedule',methods=['get','post'])
def hospital_manage_shedule():

	data={}
	did=request.args['did']
	data['did']=did
	q="SELECT * FROM `scheduling`  where doctor_id='%s'"%(did)
	res=select(q)
	data['shedule']=res


	if 'submit' in request.form:

		ft=request.form['ft']
		tt=request.form['tt']
		
		q="INSERT INTO scheduling VALUES(NULL,'%s','%s','%s')"%(did,ft,tt)
		print(q)
		id=insert(q)
		flash("ADDED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_manage_shedule',did=did))

	if 'action' in request.args:
		action=request.args['action']
		shid=request.args['shid']
	else:
		action=None
	if action=='delete':
			q="delete from scheduling where scheduling_id='%s'"%(shid)
			delete(q)
			flash("Deleted succesfully")
			return redirect(url_for('hospital.hospital_manage_shedule',did=did))
	if action=='update':
			r="select * from scheduling where scheduling_id='%s'"%(shid)
			data['up']=select(r)
	if 'update' in request.form: 
		ft=request.form['ft']
		tt=request.form['tt']
		shid=request.args['shid']
		q="update scheduling set ftime='%s',ttime='%s' where scheduling_id='%s'"%(ft,tt,shid)
		update(q)
		flash("UPDATED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_manage_shedule',did=did))	
	return render_template('hospital_manage_shedule.html',data=data)



@hospital.route('/hospital_blood_donationcamp',methods=['get','post'])
def hospital_blood_donationcamp():
	data={}
	q="SELECT * FROM `blooddonation`"  
	res=select(q)
	data['view']=res

	if 'submit' in request.form:
		place=request.form['place']
		date=request.form['date']
		ft=request.form['ft']
		tt=request.form['tt']
		q="insert into blooddonation values(null,'%s','%s','%s','%s')"%(place,date,ft,tt)
		insert(q)
		flash("ADD SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_blood_donationcamp'))
	if 'action' in request.args:
		action=request.args['action']
		b_id=request.args['b_id']
	else:
		action=None
	if action=='delete':
			q="delete from blooddonation where blooddonation_id='%s'"%(b_id)
			delete(q)
			flash("Deleted succesfully")
			return redirect(url_for('hospital.hospital_blood_donationcamp'))
	if action=='update':
			r="select * from blooddonation where blooddonation_id='%s'"%(b_id)
			data['up']=select(r)
	if 'update' in request.form: 
		place=request.form['place']
		date=request.form['date']
		ft=request.form['ft']
		tt=request.form['tt']
		q="update blooddonation set place='%s',date='%s', fromtime='%s',tofrom='%s' where blooddonation_id='%s'"%(place,date,ft,tt,b_id)
		update(q)
		flash("UPDATED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_blood_donationcamp'))


	return render_template('hospital_blood_donationcamp.html',data=data)



@hospital.route('/hospital_managelab',methods=['get','post'])
def hospital_managelab():

	data={}

	q="SELECT * FROM `lab`"  
	res=select(q)
	data['lab']=res

	# q="SELECT * FROM `departments`"
	# res=select(q)
	# data['dept']=res

	if 'submit' in request.form:
		name=request.form['name']
		detail=request.form['detail']

		q1="INSERT INTO `lab` VALUES(null,'%s','%s','%s')"%(session['hid'],name,detail)
		insert(q1)
		flash("Added Successfully.....")
		return redirect(url_for('hospital.hospital_managelab'))
	
	if 'action' in request.args:
		action=request.args['action']
		lid=request.args['lid']
	else:
		action=None
	if action == 'delete':
		q="delete from lab where lab_id='%s'"%(lid)
		delete(q)
		flash("DELETED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_managelab'))
	if action == 'update':
		e="select * from lab where lab_id='%s'"%(lid)
		data['up']=select(e)
	if 'update' in request.form:
		name=request.form['name']
		detail=request.form['detail']

		q="update lab set name='%s',details='%s' where lab_id='%s'"%(name,detail,lid)
		update(q)
		flash("UPDATED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_managelab'))
	return render_template('hospital_manage_lab.html',data=data)



@hospital.route('/hospital_manageambulance',methods=['get','post'])
def hospital_manageambulance():

	data={}

	q="SELECT * FROM `ambulance`"  
	res=select(q)
	data['lab']=res

	# q="SELECT * FROM `departments`"
	# res=select(q)
	# data['dept']=res

	if 'submit' in request.form:
		name=request.form['name']
		detail=request.form['detail']
		phone=request.form['phone']
		reg=request.form['reg']
		q1="INSERT INTO `ambulance` VALUES(null,'%s','%s','%s','%s','%s')"%(session['hid'],name,detail,phone,reg)
		insert(q1)
		flash("Added Successfully.....")
		return redirect(url_for('hospital.hospital_manageambulance'))
	
	if 'action' in request.args:
		action=request.args['action']
		aid=request.args['aid']
	else:
		action=None
	if action == 'delete':
		q="delete from ambulance where Ambulance_id='%s'"%(aid)
		delete(q)
		flash("DELETED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_manageambulance'))
	if action == 'update':
		e="select * from ambulance where Ambulance_id='%s'"%(aid)
		data['up']=select(e)
	if 'update' in request.form:
		name=request.form['name']
		detail=request.form['detail']
		phone=request.form['phone']
		reg=request.form['reg']

		q="update ambulance set Ambulance='%s',Details='%s',phone='%s',Regnum='%s'"%(name,detail,phone,reg)
		update(q)
		flash("UPDATED SUCCEFULLY...")
		return redirect(url_for('hospital.hospital_manageambulance'))
	return render_template('hospital_manageambulance.html',data=data)



