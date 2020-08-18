class Employee:

    bonus = 1.30

    def __init__ (self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
    

    @property
    def fullname (self):
        return '{} {}'.format(self.first, self.last)
    @property
    def email (self):
        return '{}.{}@yahoo.com'.format(self.first, self.last)

    def pay_raise (self):
        self.pay = int(self.pay * Employee.bonus)

class developer (Employee):
    
    def __init__(self, first, last, pay, prog_lang):
        super().__init__(first, last, pay)
        self.prog_lang = prog_lang
    


dev_1 = developer('andrew', 'von Rajcs', 6000, 'Python') 
emp_1 = Employee('Matt', 'von Rajcs', 5000)


print(emp_1.first)
print(emp_1.fullname)
print(emp_1.email)
print(emp_1.pay)
emp_1.pay_raise()
print(emp_1.pay)


print(dev_1.fullname)
print(dev_1.email)
print(dev_1.prog_lang)


#emp_1.first = 'Matt'
#emp_1.last = 'von Rajcs'
#emp_1.email = 'Matt.von Rajcs@yahoo.com'

