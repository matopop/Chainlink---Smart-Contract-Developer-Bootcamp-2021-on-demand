pragma solidity ^0.6.7;

contract myFirstContract {

    uint256 number;

    function changeNumber(uint _num) public {
        number = _num;
    }
    
    function getNumber() public view returns (uint256) {
        return (number);
    }
}
