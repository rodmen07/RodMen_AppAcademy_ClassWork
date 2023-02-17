def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    new_arr = []
    str.split(" ").each { |ele| new_arr << prc.call(ele) }
    new_arr.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num)
    else
        return prc_2.call(num)
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if prc_1.call(ele) && prc_2.call(ele)
    end
    return new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index { |ele, i| i.even? ? new_arr << prc_1.call(ele) : new_arr << prc_2.call(ele) }
    return new_arr
end
