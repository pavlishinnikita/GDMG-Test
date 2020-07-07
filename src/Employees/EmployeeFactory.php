<?php

namespace App\Employees;

use App\Employees\Developer;
use App\Employees\Tester;
use App\Employees\Designer;
use App\Employees\Manager;
use App\Exceptions\InvalidTypeException;

class EmployeeFactory 
{
    public function create($type) 
    {
        $employee = null;
        if ($type === 'developer') {
            $employee = new Developer();
        } else if ($type === 'tester') {
            $employee = new Tester();
        } else if ($type === 'designer') {
            $employee = new Designer();
        } else if ($type === 'manager') {
            $employee = new Manager();
        } else {
            throw new InvalidTypeException('Type not avaliable');
        }
        return $employee;
    }
}
