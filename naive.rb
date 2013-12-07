module Buyes
    class Naive
        FEAT = 0; CLASSIFIER = 1

        def initialize(get_feats=nil)
            @total_count = 0

            @classiffiers, @features = {}, {}
            @classiffiers.default, @features.default = 0, 0

            @get_feats = (get_feats.nil?) ? 
                            lambda {|obj| [ obj[0], obj[obj.length >> 1], obj[-1]]}
                            : get_feats
        end

        def train(train_set)
            @total_count = train_set.length

            train_set.each do |item|
                @classiffiers[item[CLASSIFIER]] += 1

                @get_feats.call(item[FEAT]).each do |feat|
                    @features[[item[CLASSIFIER], feat]] += 1                    
                end
            end
            score()
        end

        def score()
            @features.each_pair do |k, v|
                @features[k] /= @classiffiers[k[0]].to_f
            end
            @classiffiers.each_pair do |k, v|
                @classiffiers[k] /= @total_count.to_f
            end
        end

        def classify(obj)
            def sum(cls, obj)
                result = -Math.log(@classiffiers[cls]) 
                @get_feats.call(obj).each do |feat|
                    result += -Math.log(@features[[cls, feat]]) 
                end
                result
            end
            @classiffiers.keys.min_by{|cls| sum(cls, obj)}
        end

        def test(test_set)
            hits = 0
            test_set.each do |item|
                if item[CLASSIFIER] == classify(item[FEAT]) then hits += 1 end
            end
            hits.to_f / test_set.length
        end
    end
end