<?php 

use PHPUnit\Framework\TestCase;
use App\Employees\EmployeeFactory;
use App\Exceptions\InvalidTypeException;
use App\Employees\Developer;
use App\Employees\Tester;
use App\Employees\Designer;
use App\Employees\Manager;

class EmployeeFactoryTest extends TestCase 
{
    public function testCreateWithException() 
    {
        $employeeFactory = new EmployeeFactory();
        try {
            $employeeFactory->create('wrongType');
        } catch (InvalidTypeException $e) {
            $this->assertStringContainsString('Type not avaliable', $e->getMessage(), 'Strings not equals');
        }
    }

    public function testCreateWithoutException() 
    {
        $employee = null;
        $employeeFactory = new EmployeeFactory();

        $employee = $employeeFactory->create('developer');
        $this->assertTrue($employee instanceof Developer, 'Not developer was created');

        $employee = $employeeFactory->create('tester');
        $this->assertTrue($employee instanceof Tester, 'Not tester was created');

        $employee = $employeeFactory->create('designer');
        $this->assertTrue($employee instanceof Designer, 'Not designer was created');

        $employee = $employeeFactory->create('manager');
        $this->assertTrue($employee instanceof Manager, 'Not manager was created');
    }
}
