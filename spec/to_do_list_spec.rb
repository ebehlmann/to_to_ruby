require 'rspec'
require 'task'
require 'list'

describe Task do
	it 'is initialized with a description' do
		test_task = Task.new('scrub the zebra')
		test_task.should be_an_instance_of Task
	end

	it 'lets you read the description out' do
		test_task = Task.new('scrub the zebra')
		test_task.description.should eq 'scrub the zebra'
	end
end

describe List do
	it 'starts out with an empty array of tasks' do
		test_list = List.new('School stuff')
		test_list.tasks.should eq []
	end

	it 'can add tasks' do
		test_list = List.new('School stuff')
		test_list.add_task('Learn Ruby')
		test_list.tasks.length.should eq 1
	end

	describe '.all' do
		it 'is empty at first' do
			List.all.should eq []
		end

		it 'gets added to when save is called on an instance' do
			test_list = List.new('School stuff')
			test_list.save
			List.all.should eq [test_list]
		end
	end
end