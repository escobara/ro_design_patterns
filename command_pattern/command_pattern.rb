class Command
	attr_reader :description

	def initialize(description)
		@description = description
	end

	def execute
	end
end

class CreateFile < Command

	def initialize(path, contents)
		super("Create File: #{path}")
		@path = path
		@contents = contents
	end

	def execute
		f = File.open(@path, "w")
		f.write(@contents)
		f.close
	end
end

class DeleteFile < Command

	def initialize(path)
		super("Delete File: #{path}")
		@path = path
	end

	def execute
		File.delete(@path)
	end
end


class CopyFile < Command
	def initialize(source, target)
		super("Copy file: #{source} to #{target}")
		@source = source
		@target = target
	end

	def execute
		FileUtils.copy(@source, @target)
	end
end