<?php

namespace App\Employees;

use App\Interfaces\IWrite;
use App\Interfaces\ITest;
use App\Interfaces\IDraw;
use App\Interfaces\ITask;
use App\Interfaces\ISpeak;

abstract class Employee
{
    private $skillArray = [];
    private $skills = '';

    public function __construct()
    {
        if ($this instanceof IWrite) {
            $this->skills .= 'code writing' . PHP_EOL;
            array_push($this->skillArray, 'writeCode');
        }
        if ($this instanceof ITest) {
            $this->skills .= 'code testing' . PHP_EOL;
            array_push($this->skillArray, 'testCode');
        }
        if ($this instanceof IDraw) {
            $this->skills .= 'drawing the design' . PHP_EOL;
            array_push($this->skillArray, 'draw');
        }
        if ($this instanceof ITask) {
            $this->skills .= 'tasks setting' . PHP_EOL;
            array_push($this->skillArray, 'setTasks');
        }
        if ($this instanceof ISpeak) {
            $this->skills .= 'communication with manager' . PHP_EOL;
            array_push($this->skillArray, 'communicate');
        }
    }

    public function getTypeOfWorks(): string
    {
        return $this->skills ?? 'nothing';
    }

    public function isPossibleSkill($skill): bool
    {
        return in_array($skill, $this->skillArray);
    }
}
