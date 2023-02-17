def my_map(arr, &prc)
    mapped = []
    arr.each do |ele|
        mapped << prc.call(ele)
    end
    mapped
end

def my_select(arr, &prc)
    selected = []
    arr.each { |ele| selected << ele if prc.call(ele) == true }
    selected
end

def my_count(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) == true}
    count
end

def my_any?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) == true }
    false
end

def my_all?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) == false }
    true
end

def my_none?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) == true }
    true
end
