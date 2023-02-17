def my_reject(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << ele if !prc.call(ele) }
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    return true if count == 1
    return false
end

def hash_select(hash, &prc)
    new_hash = Hash.new
    hash.each do |k,v|
        new_hash[k] = hash[k] if prc.call(k,v)
        end
        new_hash
end

def xor_select(arr, prc_1, prc_2)
    new_arr = []
    new_arr = arr.select do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            false
        elsif (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele))
            true
        end
    end
    return new_arr
end

def proc_count(value, procs_array)
    count = 0
    procs_array.each { |prc| count += 1 if prc.call(value) }
    count
end
