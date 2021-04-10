pragma solidity ^0.8.0;

contract StudentIdentity{
    uint counter=0;
    uint entry;
    uint exit;
    struct Student{
        uint id;
        string name;
        string clgname;
        uint passingyear;
        string email;
        bool isRegistered;
        uint entrytime;
                uint exittime;

         
    }
    mapping (address=> Student) students;
    function registerStudent(string memory _name,string memory _clgname,uint _passingyear,string memory _email )public 
    {
        require(students[msg.sender].isRegistered==false,"You are already registered");
        counter++;
        Student memory student1 = Student(counter,_name,_clgname,_passingyear,_email,true,0,0);
        students[msg.sender]=student1;
        
        
    }
    function Entry()public{
        require(students[msg.sender].isRegistered==true,"You are not registered");
        
        students[msg.sender].entrytime=block.timestamp;
        
    }
    function getEntryTime()public view returns(uint256){
        return students[msg.sender].entrytime;
        
    }
    function getExitTime()public view returns(uint256){

        return students[msg.sender].exittime;
    }
    function Exit()public {
        require(students[msg.sender].isRegistered==true,"You are not registered");
        
         students[msg.sender].exittime=students[msg.sender].entrytime-1000000000;
        
    }
}