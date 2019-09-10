# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    #Part 1
    def span
        if self.empty?
            return nil
        else
            self.max - self.min
        end
    end

    def average
        if self.empty?
            return nil
        else
            self.sum.to_f / self.length.to_f
        end
    end

    def median
        if self.empty?
            return nil
        end

        arr = self.sort

        if self.length % 2 == 0
            new_arr = []
            new_arr << arr[self.length / 2]
            new_arr << arr[(self.length / 2) - 1]
            new_arr.average
        else
            arr[(self.length - 1) / 2]
        end
    end

    def counts
        newHash = Hash.new(0)
        self.each do |el|
            newHash[el] += 1
        end
        newHash
    end

    #Part 2

    def my_count(key)
        hash = self.counts
        hash[key]
    end

    def my_index(el)
        # return nil if !self.include?(el)
        # new_arr = []
        # self.each_with_index do |char, i|
        #     if self[i].include?(el)
        #         new_arr << i
        #     end
        # end
        # new_arr[0]
        
        return nil if !self.include?(el)
        self.each_with_index do |char, i|
            if char == el
                return i
            end
        end
    end

    def my_uniq
        new_arr = []
        self.each do |char|
            if !new_arr.include?(char)
                new_arr << char
            end
        end
        return new_arr
    end

    def my_transpose
        transpose = Array.new(self.length) { [] }
        self.each do |subarray|     #[d, e, f]
            subarray.each_with_index do |el, i|     #[[], [], []]
                transpose[i] << el  #[[a, d], [b, e], [c, f]]
            end
        end
        transpose
    end
end
