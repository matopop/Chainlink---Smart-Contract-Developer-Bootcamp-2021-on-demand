pragma solidity ^0.6.7;

contract myFirstContract {

    uint256 number = 0;

    function incrementNumber(uint256 _num) public {
        number += _num;
    }
    
    function getNumber() public view returns (uint256) {
        return (number);
    }
    
    function getNumberMultiplied(uint256 _num) public view returns (uint256){
        return (number * _num);
    }
    
    function addNumbers(uint256 _num1, uint256 _num2) public {
        number += (_num1 + _num2);
    }
    

}
