# Notes from chapter 5

## Page 113 - about environment variables: 
- You can test remote environment variables using the `ansible` command:  
  `ansible test -m shell -a 'echo $TEST'`  
  When doing so, be careful with the use of quotes and escaping, you might end up using double quotes where you meant to  
  use single quotes.

### Variables
Variables in ansible are snake-case.
- In an inventory file, a variable's value is assigned using an equals sign: `foo=bar`.
- In a playbook or variables include file, a variable's value is assigned using a colon: `foo: bar`

### Playbook Variables
Variables can be passed in via the command line, when calling `ansible-playbook`, with the `--extra-vars` option.
`ansible-playbook example.yml --extra-vars "foo=bar"`  

Variables may be included inline with the rest of the playbook, in a `vars` section:
```
---
- hosts: example
  vars:
    foo: bar
  tasks:
    # Prints "Variable 'foo' is set to bar".
    -debug: msg="Variable 'foo' is set to {{ foo }}"
```  

Variables may also be included in a separate file, using the `vars_file` section:
```
---
# Main playbook file:
- hosts: example
  vars_file:
    - vars.yml
  tasks:
    - debug: msg="Variable 'foo' is set to {{ foo }}"
  
    
 ---
 # Variables file 'vars.yml' in the same folder as the playbook.
 foo: var
```
