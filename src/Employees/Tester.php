<?php

namespace App\Employees;

use App\Interfaces\ITask;
use App\Interfaces\ITest;
use App\Interfaces\ISpeak;

class Tester extends Employee implements
    ITask,
    ITest,
    ISpeak
{
}
