<?php

namespace App\Employees;

use App\Interfaces\IDraw;
use App\Interfaces\ISpeak;

class Designer extends Employee implements
    IDraw,
    ISpeak
{
}
