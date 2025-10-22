using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PartialClassDemonstration
{
    partial class Student
    {
        int id;
        string name;
        public void setData(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
    }

    partial class Student
    {
        int age;
        public Student()
        {
            age = 10;
        }
        public void display()
        {
            Console.WriteLine("Id : " + id + "\nName : " + name + "\nAge : " + age);
        }
    }


    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("**Partial Class Demonstration**\n");
            Student s1 = new Student();
            s1.setData(86, "Somnath Jadhav");
            s1.display();
            Console.Read();
        }
    }
}
