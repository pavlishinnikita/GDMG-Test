<?php
namespace App\Console\Commands;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Output\OutputInterface;
use App\Employees\EmployeeFactory;

class CheckPossibilityCommand extends Command
{
    protected function configure() 
    {
        $this->setName('can')
            ->setDescription('Check possibility for user behaviour')
            ->setHelp('Pass user skill for check possibility.' . 
                PHP_EOL . 'Avaliable types: developer, manager, tester, designer. ' . 
                PHP_EOL . 'Avaliable skills: writeCode, testCode, draw, communicate, setTasks')
            ->addArgument('type', InputArgument::REQUIRED, 'Pass the type of user')
            ->addArgument('skill', InputArgument::REQUIRED, 'Pass the skill of user');
    }

    protected function execute(InputInterface $input, OutputInterface $output) 
    {
        $factory = new EmployeeFactory();
        $type = $input->getArgument('type');
        $employee = $factory->create($type);
        $output->writeln(
            sprintf('%s', $employee->isPossibleSkill($input->getArgument('skill')))
        );
    }

}
