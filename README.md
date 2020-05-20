# SAS Macro Utilities

Collection of utility SAS macros for data management and utility purposes.

# Components

**ucmacros**:
 * Uncompiled SAS macro source
 * OS agnostic

# Installation

Clone or download the repository to a location your SAS session can access. Update **sasautos** option to include the **ucmacros** directory.  This can be done within a SAS program directly or within a SAS autoexec process.

For example:
```sas
options append=(sasautos="/your/path/sas-macro-util/ucmacros");
```

# Usage

After **sasautos** is updated with the source **ucmacros** directory, call the desired SAS macro using standard SAS macro programming along with desired parameters.  Check the header contained within each source file.

For example:
```sas
%dbug(level=2,log=/tmp/test.log);
```

# Standards

## File Properties

 - filenames much match macro names
 - filenames must be lowercase using underscores
 - macro names must be lowercase
 - one macro per file
 - unix style line endings (LF)
 - UTF-8

## Header Properties

 - **Purpose:** very short description of the purpose and goal of the macro.
 - **Parameters:** short description of each parameter itemized in a list.

Additional properties such as last modified timestamps, authorship and revision history are maintained within the git repository.

## Coding Standards

*  Indentation = 2 spaces with no tabs.
*  Macro variables should not have the trailing dot (`&var` not `&var.`) unless necessary to prevent incorrect resolution. For example, dataset references within macros may use a trailing dot.
*  Closing `%mend;` contains the macro name.
*  All parameters are keyword style. Default values can be defined within each macro.

# General Notes

* Macros were built starting from SAS version 9.2.  All macros should be compatible with SAS versions 9.2 and later.

# Author

 - [Steve Overton](https://www.linkedin.com/in/overton/)
