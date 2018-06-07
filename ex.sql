-- pseudocode
create table employee (
    id
    name
    dept_id references dept(id)
)

create table dept (
    id
    dept_name
    dept_address
)
inset into dept (id, dept_name, dept_address) values (1, 'dev', '123 Main St')

insert into employee ( name, dept_id) values ("Amanda", 1);
insert into employee ( name, dept_id) values ("John", 1);
insert into employee ( name, dept_id) values ("Frank", 1);
insert into employee ( name, dept_id) values ("Bill", 2);