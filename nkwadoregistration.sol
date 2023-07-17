// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Nkwadoreg {
    // Struct to store member details
    struct Details {
        string Name;
        uint256 dateOfBirth;
        string gender;
        string nationalId;
        string maritalStatus;
        string bloodType;
    }

    struct ContactInfo {
        string houseaddress;
        string contactNumber;
        string emailAddress;
        string emergencyContactName;
        string emergencyContactNumber;
    }

    struct Member {
        Details details;
        ContactInfo contactInfo;
        bool isRegistered;
    }

    // Mapping to store members by their Ethereum address
    mapping(address => Member) public members;

    // Mapping to check if a member is registered
    mapping(address => bool) public isMemberRegistered;

    // Mapping to store member ID codes
    mapping(address => uint256) public memberIdCodes;

    // Counter for total members
    uint256 public totalMembers;

    // Counter for generating unique member ID codes
    uint256 public currentIdCode;

    // Event emitted when a member is registered
    event MemberRegistered(
        address indexed memberAddress,
        uint256 indexed memberIdCode
    );

    Details[] public registeredMembers;

    // Function to register a new member
    function registerMember(
        string memory _Name,
        uint256 _dateOfBirth,
        string memory _gender,
        string memory _nationalId,
        string memory _maritalStatus,
        string memory _bloodType
     ) public {
        // Check if member is already registered
        require(!isMemberRegistered[msg.sender], "Member already registered");



        // Create a new Member struct with the provided details
        registeredMembers.push(Details({Name:_Name, dateOfBirth:_dateOfBirth, gender:_gender, nationalId:_nationalId, maritalStatus:_maritalStatus, bloodType:_bloodType}));

        // Increment the totalMembers counter
        totalMembers++;

        // Assign a unique member ID code and store it in the memberIdCodes mapping
        memberIdCodes[msg.sender] = currentIdCode;
        currentIdCode++;

        // Emit the MemberRegistered event
        emit MemberRegistered(msg.sender, memberIdCodes[msg.sender]);
    }
}