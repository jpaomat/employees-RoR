class Employee < ApplicationRecord
    validates :idEmployee, presence: true
    validates :fullname, presence: true
    validates :occupation, presence: true
    validates :idBoss, presence: true
end
