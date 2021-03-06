require 'ffi/pointer'
module FFI
  class MemoryPointer
      # call-seq:
      #   MemoryPointer.new(num) => MemoryPointer instance of <i>num</i> bytes
      #   MemoryPointer.new(sym) => MemoryPointer instance with number
      #                             of bytes need by FFI type <i>sym</i>
      #   MemoryPointer.new(obj) => MemoryPointer instance with number
      #                             of <i>obj.size</i> bytes
      #   MemoryPointer.new(sym, count) => MemoryPointer instance with number
      #                             of bytes need by length-<i>count</i> array
      #                             of FFI type <i>sym</i>
      #   MemoryPointer.new(obj, count) => MemoryPointer instance with number
      #                             of bytes need by length-<i>count</i> array
      #                             of <i>obj.size</i> bytes
      #   MemoryPointer.new(arg) { |p| ... }
      #
      # Both forms create a MemoryPointer instance. The number of bytes to
      # allocate is either specified directly or by passing an FFI type, which
      # specifies the number of bytes needed for that type.
      #
      # The form without a block returns the MemoryPointer instance. The form
      # with a block yields the MemoryPointer instance and frees the memory
      # when the block returns. The value returned is the value of the block.

#      def self.new(type, count=nil, clear=true)
#        size = if type.kind_of? Fixnum
#          type
#        elsif type.kind_of? Symbol
#          FFI.type_size(type)
#        else
#          type.size
#        end
#        ptr = self.__allocate(size, count, clear)
#        ptr.type_size = size
#        if block_given?
#          begin
#            value = yield ptr
#          ensure
#            ptr.free
#          end
#          value
#        else
#          ptr
#        end
#      end
      def self.from_string(s)
        ptr = self.new(s.length + 1, 1, false)
        ptr.put_string(0, s)
        ptr
      end
      # Indicates how many bytes the type that the pointer is cast as uses.
      # attr_accessor :type_size

      # Access the MemoryPointer like a C array, accessing the +which+ number
      # element in memory. The position of the element is calculate from
      # +@type_size+ and +which+. A new MemoryPointer object is returned, which
      # points to the address of the element.
      #
      # Example:
      #   ptr = MemoryPointer.new(:int, 20)
      #   new_ptr = ptr[9]
      #
      # c-equiv:
      #   int *ptr = (int*)malloc(sizeof(int) * 20);
      #   int *new_ptr;
      #   new_ptr = &ptr[9];
      #
#      def [](which)
#        self + (which * type_size)
#      end
  end
end
