# Nkwadoreg Contract
This contract allows for the registration and storage of member details in the Nkwadoreg system.

SPDX-License-Identifier: MIT
The Nkwadoreg contract is licensed under the MIT License. You can find the license text in the LICENSE file.

Prerequisites
Solidity version: ^0.8.18
Contract Overview
The Nkwadoreg contract consists of the following components:

Structs
Details: Stores the member's personal information, including Name, date of birth, gender, national ID, marital status, and blood type.

ContactInfo: Stores the member's contact information, including house address, contact number, email address, emergency contact name, and emergency contact number.

Member: Combines the Details and ContactInfo structs and includes a flag to indicate whether the member is registered.

Mappings
members: Maps Ethereum addresses to Member structs, allowing efficient retrieval of member information.

isMemberRegistered: Maps Ethereum addresses to boolean values, indicating whether a member is already registered.

memberIdCodes: Maps Ethereum addresses to unique member ID codes.
Counters

totalMembers: Keeps track of the total number of registered members.
currentIdCode: Generates unique member ID codes for each registered member.

Events

MemberRegistered: Emitted when a member is successfully registered, providing the member's address and ID code.

Functions

registerMember: Allows a new member to register by providing their personal and contact information. Checks if the member is already registered and creates a new Member struct with the provided details. Increments the totalMembers counter, assigns a unique member ID code, and emits the MemberRegistered event.

registeredMembers: Public array containing the Details of all registered members.

Usage
To use the Nkwadoreg contract, follow these steps:

Deploy the contract to the Ethereum network using a Solidity compiler compatible with version ^0.8.18.

Call the registerMember function with the following parameters:
_Name: The member's name.

_dateOfBirth: The member's date of birth as a uint256 value.

_gender: The member's gender.
_nationalId: The member's national ID.

_maritalStatus: The member's marital status.

_bloodType: The member's blood type.
Check the emitted MemberRegistered event to obtain the member's 

Ethereum address and ID code.

Access member information using the various mappings or the registeredMembers array.

License
This contract is licensed under the MIT License. See the LICENSE file for more information.
