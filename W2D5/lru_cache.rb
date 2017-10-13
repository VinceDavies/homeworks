class LRUCache

  attr_accessor :cache, :num_objs

   def initialize(num_objs)
     @num_objs = num_objs
     @cache = Array.new(num_objs){|el| el = nil }
   end

   def count
     # returns number of elements currently in cache
     return @cache.length
   end

   def add(el)
     # adds element to cache according to LRU principle
     @cache.push(el)
     @cache.delete_at(0) if @cache.length >= num_objs
   end

   def show
     # shows the items in the cache, with the LRU item first
     puts @cache 
   end

   private
   # helper methods go here!

 end
