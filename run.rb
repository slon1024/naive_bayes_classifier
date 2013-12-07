# coding: utf-8 

$LOAD_PATH << File.dirname(__FILE__)
require 'naive'

def get_items(file_name)
    items = []
    File.open(file_name).each(sep="\n") do |line|
        items << line.strip.split(' ')
    end
    items
end

def sample(items, filter)
    result = []
    items.each_with_index do |item, index|
        if filter.call(item, index) then next end
        result << item
    end
    result
end

def gen_a(from, to)
    (from..to).map{|x| x}
end

def experiment(interval, items)
    buyes = Buyes::Naive.new() #lambda {|obj| [obj[0]]}
    buyes.train(items[0..interval]) #sample(items, lambda {|item, index| index % 2 != 0})
    buyes.test(items[(interval+1)..items.length]) #sample(items, lambda {|item, index| index % 2 == 0})
end

begin
    items = get_items('source/polish_names.txt')
    f = File.open("data/test_avg_from0_to1500.tsv", "a")#_to#{interval}_from#{interval}
    f.write("interval\accuracy\n")

    gen_a(0,1500).each do |interval|
        accuracy = 0.0
        count_attempt = 200
        
        gen_a(1, count_attempt).each_with_index do |attempt, index|
            accuracy += experiment(interval, items.shuffle)            
        end
        accuracy /= count_attempt

        f.write("#{interval}\t#{accuracy}\n")
    end
ensure
    f.close()
end

#puts buyes.classify("Aga")

#buyes = Buyes::Naive.new() #lambda {|obj| [obj[0]]})
#buyes.train(sample(items, lambda {|item, index| index % 3 != 0}))
#puts buyes.test(sample(items, lambda {|item, index| index % 3 == 0}))