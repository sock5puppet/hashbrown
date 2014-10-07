Hash Brown
=========

**Hash Brown** is a script that takes a file of _MD4, MD5, SHA1, SHA256, RMD160, LM, NTLM, MYSQL, CISCO7 or JUNIPER_ hashes and runs them against the password utility findmyhash.  It then dumps the results into a delimited file, making hashbrowns! =)

**Author:** Sock5 Puppet (@sock5puppet)

**Prerequisites:**

1. findmyhash installed and accessible
2. file containing supported hashes, one per line

**Release Dates:**

| Date | Version |
| 09/25/2014 | v1.0 |
| 10/07/2014 | v1.0.1 |

**Changes:**
Version 1.0
* Initial release

Version 1.0.1
* Report on status of hash discovery during process
* Code cleanup
* Complete recreation due to file deletion, ugh.
* Ascii graphic addition
  - http://patorjk.com

**To Do List:**
* Support multi-field files
* Include usernames
* Input validation for hashfiles
* Input validation for types of hashes
* Delimiter validation and restrictions
* Progress report during discovery
