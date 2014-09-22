class List
	def initialize(description)
		@description = description
		@tasks = []
	end
	def tasks
		@tasks
	end
	def add_task(task)
		@tasks << task
	end
	def description
		@description
	end
end