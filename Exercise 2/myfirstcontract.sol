pragma solidity ^0.6.7;

contract myFirstContract {

    uint256 number = 0;
    string[] names;
    mapping (string => uint256) public phoneNumbers;
    
    function addMobileNumber(string memory _name, uint256 _mobileNumber) public {
        phoneNumbers[_name] = _mobileNumber;
    }
    
    function getMobileNumber(string memory _name) public view returns (uint256) {
        return (phoneNumbers[_name]);
    }
    
    function addName(string memory _name) public {
        names.push(_name);
    }
    
    function getName(uint256 _index) public view returns (string memory){
        return names[_index];
    }
    
    function changeNumber(uint256 _num) public {
        number = _num;
    }
    
    function getNumber() public view returns (uint256) {
        return (number);
    }
    
}
