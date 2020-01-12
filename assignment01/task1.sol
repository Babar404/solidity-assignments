ragma solidity ^0.5.0;

contract EnrolStudent { // main contract
    address payable private myAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; // owner aaddress to rec ether
    uint numberofStudents = 0; // students count
     
    struct Student {
        uint rollNumber;  // custom data type
        string name;
        bool degree;
        reg RegTYpe;
    }
    
    enum reg {onsite , online}  // enum custom datatype
    
    modifier verify(){
        if(msg.value >= 2 ether){  // condition checker to run function payEnroll
            _;
        }
    } 
    
    mapping(uint => Student) findingStudentsData; // students data is stored in dictionary by his/her roll number key
    
    function payEnroll (uint _rollNumber , string memory _name, bool _degree, reg _RegTYpe) public payable verify returns(uint){ // function
        findingStudentsData[_rollNumber] = Student(_rollNumber,_name,_degree,_RegTYpe); // feeding mapping by key value pair
        myAddress.transfer(msg.value); // sending ether to owner
        numberofStudents = numberofStudents+1; // increasing stu count
        return numberofStudents; // returning how many students have enrolled
        
    }
    
    function getBalance() public view returns(uint){  // simply checking my own balance
    return myAddress.balance;
    }
    
    
    
}