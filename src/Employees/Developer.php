<?php

namespace App\Employees;

use App\Interfaces\IWrite;
use App\Interfaces\ITest;
use App\Interfaces\ISpeak;

class Developer extends Employee implements
    IWrite,
    ITest,
    ISpeak
{
}
