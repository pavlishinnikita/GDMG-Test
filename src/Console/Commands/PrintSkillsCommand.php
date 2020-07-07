<?php
namespace App\Console\Commands;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Output\OutputInterface;
use App\Employees\EmployeeFactory;

class PrintSkillsCommand extends Command
{
    protected function configure() 
    {
        $this->setName('user')
            ->setDescription('Print skills for user type')
            ->setHelp('Pass user type for print skills.')
            ->addArgument('type', InputArgument::REQUIRED, 'Pass the type of user');
    }

    protected function execute(InputInterface $input, OutputInterface $output) 
    {
        $factory = new EmployeeFactory();
        $type = $input->getArgument('type');
        $employee = $factory->create($type);
        $output->writeln(
            sprintf('%s', $employee->getTypeOfWorks())
        );
    }
}
