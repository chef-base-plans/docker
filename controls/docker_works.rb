title 'Tests to confirm docker works as expected'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'docker')

control 'core-plans-docker-works' do
  impact 1.0
  title 'Ensure docker works as expected'
  desc '
  Verify docker by ensuring 
  (1) its installation directory exists and 
  (2) that it returns the expected version.  Note that as the CI uses docker
  to run the tests, it is expected for docker to return warning, which are 
  accounted for in the tests.  This will not normally happen in hab studio or
  a linux environment
  '
  
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stderr') { should be_empty }
  end
  
  command_relative_path = input('command_relative_path', value: 'bin/docker')
  command_full_path = File.join(plan_installation_directory.stdout.strip, command_relative_path)
  plan_pkg_version = plan_installation_directory.stdout.split("/")[5]
  describe command("#{command_full_path} version") do
    its('exit_status') { should eq 1 }
    its('stdout') { should_not be_empty }
    its('stdout') { should match /Version:\s+(?<version>#{plan_pkg_version})/ }
    its('stderr') { should match /Cannot connect to the Docker daemon at unix:\/\/\/var\/run\/docker.sock/ }
  end
end