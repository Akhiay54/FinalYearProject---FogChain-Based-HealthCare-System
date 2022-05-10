//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
/**
* @title Medical records
* @dev Store & retreive Doctor details
*/
contract Fogchain {
  
  
   mapping(uint256 => patient) patientlist;
   mapping(uint256 => attendant []) attendantlist;
   mapping(uint256 => doctor) doctorlist;
   mapping(uint256 => patientmedicaldetail []) patientmedicaldetaillist;
   mapping(uint256 => hospital) hospitallist;
   mapping(uint256 => uint256) runtime;
  
  
   struct patient{
       string patient_name;
       uint256 age;
       string gender;
       uint256 date;
       address patient_hash_value;
   }
   patient p;
   
   struct attendant{
       uint256 patient_id;
       string  attendant_name;
       string  attendant_relation;
       uint256 attendant_phn_no;
   }
   attendant a;
 
   struct doctor{
       string doctor_name;
       string doctor_specialisation;
       uint256 doctor_ph_no;
       string doctor_address;
       address doctor_hash_value;
   }
   doctor d;
 
   struct hospital{
       string hospital_name;
       string hospital_address;
       string hospital_spec;
       address hospital_hash_value;
   }
   hospital h;
 
   struct patientmedicaldetail{
       uint256 patient_id;
       uint256 date;
       uint256 doctor_id;
       uint256 hospital_id;
       string disease;
       string duration;
       string medicines_prescribed;
   }
   patientmedicaldetail pmd;
   
   // address owner;
   
   constructor()  public {
       // owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35;
   }
    
    
   // modifier to give access only to hospital
   // modifier isOwner() {
 
   //     require(msg.sender == owner, "Access is not allowed");
 
   //     _;
 
   // }
    
   
   
   
    /**
    * @dev Store patient details
    * @param patient_id patient id
    * @param _patient_name patient name
    * @param _age age
    * @param _gender gender
    * @param _date date
    */
  
   function store_patient_details(uint256 patient_id,string memory _patient_name,uint256 _age,string memory _gender,uint256 _date,address _patient_hash_value)public  {
       p.patient_name=_patient_name;
       p.age=_age;
       p.gender=_gender;
       p.date=_date;
       p.patient_hash_value=_patient_hash_value;
       patientlist[patient_id] = p;
   }
 
   function retreive_patient_details(uint256 patient_id) public view returns (string memory,uint256,string memory,uint256,address){
       patient memory p = patientlist[patient_id];
       require(msg.sender == p.patient_hash_value, "Access is not allowed(Only Patients)");
       return (p.patient_name,p.age,p.gender,p.date,p.patient_hash_value);
  
   }
 
   /**
   * @dev Store hospital details
   * @param hospital_id hospital registration id
   * @param _hospital_name name of hospital
   * @param _hospital_spec hospital specialisation
   * @param _hospital_address hospital address
   * */
   function store_hospital_details(uint256 hospital_id,string memory _hospital_name,string memory _hospital_address,string memory _hospital_spec,address _hospital_hash_value)public {
      
       h.hospital_name = _hospital_name;
       h.hospital_address = _hospital_address;
       h.hospital_spec = _hospital_spec;
       h.hospital_hash_value=_hospital_hash_value;
       hospitallist[hospital_id] = h;
 
   }
 
   function retreive_hospital_details(uint256 hospital_id) public view returns (string memory,string memory,string memory){ 
       hospital memory h = hospitallist[hospital_id];
       require(msg.sender == h.hospital_hash_value, "Access is not allowed(Only hospitals)");
   
       return (h.hospital_name,h.hospital_address,h.hospital_spec);
   
   }
 
 
   /**
   * @dev Store doctor details
   * @param doctor_id doctor id
   * @param _doctor_name name of doctor
   * @param _doctor_specialisation specialisation of doctor
   * @param _doctor_ph_no doctor phone number
   */
   function store_doctor_details(uint16 doctor_id,string memory _doctor_name,string memory _doctor_specialisation,uint256 _doctor_ph_no,string memory _doctor_address)public{
  
       d.doctor_name = _doctor_name;
       d.doctor_specialisation = _doctor_specialisation;
       d.doctor_ph_no = _doctor_ph_no;
       d.doctor_address = _doctor_address;
    //    d.doctor_hash_value=_doctor_hash_value;
       
       doctorlist[doctor_id] = d;   
   }
 
   function retreive_doctor_details(uint16 doctor_id) public view returns (string memory,string memory,uint256){
           
       doctor memory d = doctorlist[doctor_id];
    //    require(msg.sender == d.doctor_hash_value, "Access is not allowed(Only Doctors)");
       return (d.doctor_name,d.doctor_specialisation,d.doctor_ph_no);
   
   }
 
   /**
   * @dev Store attendant details
   * @param patient_id patient id
   * @param _attendant_name name of attendant
   * @param _attendant_relation relation to patient
   * @param _attendant_phn_no phone no
   * */
 
   function store_attendant_details(uint256 patient_id,string memory _attendant_name,string memory _attendant_relation, uint256 _attendant_phn_no)public {
       
       a.patient_id = patient_id;
       a.attendant_name=_attendant_name;
       a.attendant_relation=_attendant_relation;
       a.attendant_phn_no=_attendant_phn_no;
       attendantlist[patient_id].push(a);
 
   }
  
   function retreive_attendant_details(uint256 patient_id) public view returns (attendant [] memory){
 
       patient memory p = patientlist[patient_id];
       require(msg.sender == p.patient_hash_value, "Access is not allowed(Only Patients)");
       attendant [] memory a = attendantlist[patient_id];
       return a;
   
   }
   /**
    * @dev Store patient details
    * @param patient_id patient id
    * @param _date date
    * @param doctor_id Id of doctor
    * @param hospital_id id of hospital
    * @param _disease disease name
    * @param _duration duration
    * @param _medicine medicine prescribed
    */
   function store_patient_medical_history(uint256 patient_id,uint256 _date,uint256 doctor_id,uint256 hospital_id,string memory _disease,string memory _duration,string memory _medicine) public{
       hospital memory h = hospitallist[hospital_id];
       doctor memory d = doctorlist[doctor_id];
       pmd.patient_id=patient_id;
       pmd.date=_date;
       pmd.doctor_id=doctor_id;
       pmd.hospital_id=hospital_id;
       pmd.disease=_disease;
       pmd.duration=_duration;
       pmd.medicines_prescribed=_medicine;
       patientmedicaldetaillist[patient_id].push(pmd);
   }
 
   function retreive_patient_medical_history_P(uint256 patient_id) public view returns (patientmedicaldetail [] memory){
 
       patient memory p = patientlist[patient_id];
       require(msg.sender == p.patient_hash_value, "Access is not allowed(Only Patients)");
       patientmedicaldetail [] memory pmd = patientmedicaldetaillist[patient_id];
       return pmd;
   
   }
   function retreive_patient_medical_history_D(uint256 patient_id,address _patient_hash_value) public view returns (patientmedicaldetail [] memory){
 
       patient memory p = patientlist[patient_id];
       require(_patient_hash_value == p.patient_hash_value, "Access is not allowed(Incorrect Access code)");
       patientmedicaldetail [] memory pmd = patientmedicaldetaillist[patient_id];
       return pmd;
   
   }
    function gettimestamp()public view returns (uint256){
        return block.timestamp;
    }
    // function storetimestamp(uint256 id)public{
    //     runtime[id] =block.timestamp;
    // }
}
