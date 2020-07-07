<?php

use PHPUnit\Framework\TestCase;
use App\Employees\EmployeeFactory;

class EmployeeTest extends TestCase 
{
    /**
     * @dataProvider messagesProvider
     */
    public function testMessages($expected, $actual) 
    {
        $this->assertSame($expected, $actual, 'wrong message');
    }

    /**
     * @dataProvider skillsProvider
     */
    public function testSkillsPossibility($expected, $actual) 
    {
        $this->assertSame($expected, $actual, 'wrong logic for can functionality');
    }

    public function messagesProvider() {
        $employeeFactory = new EmployeeFactory();
        $developer = $employeeFactory->create('developer');
        $tester = $employeeFactory->create('tester');
        $manager = $employeeFactory->create('manager');
        $designer = $employeeFactory->create('designer');
        return [
            'developer' => [$developer->getTypeOfWorks(), 'code writing'.PHP_EOL.'code testing'.PHP_EOL.'communication with manager' . PHP_EOL],
            'tester' => [$tester->getTypeOfWorks(), 'code testing'.PHP_EOL.'tasks setting'.PHP_EOL.'communication with manager' . PHP_EOL],
            'manager' => [$manager->getTypeOfWorks(), 'tasks setting'.PHP_EOL],
            'designer' => [$designer->getTypeOfWorks(), 'drawing the design'.PHP_EOL.'communication with manager'.PHP_EOL]
        ];
    }

    public function skillsProvider() {
        $employeeFactory = new EmployeeFactory();
        $developer = $employeeFactory->create('developer');
        $tester = $employeeFactory->create('tester');
        $manager = $employeeFactory->create('manager');
        $designer = $employeeFactory->create('designer');
        return [
            'developerTrue' => [$developer->isPossibleSkill('writeCode'), true],
            'developerFalse' => [$developer->isPossibleSkill('draw'), false],
            'tester' => [$tester->isPossibleSkill('testCode'), true],
            'manager' => [$manager->isPossibleSkill('setTasks'), true],
            'designer' => [$designer->isPossibleSkill('draw'), true],
            'worngCheck' => [$designer->isPossibleSkill('wrongSkill'), false]
        ];
    }
}
