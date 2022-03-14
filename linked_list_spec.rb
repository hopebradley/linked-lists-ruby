require 'rspec'
require_relative 'linked_list'

describe 'linked list functions' do
  it 'adds a node' do
    list = create_list [1,2,3]

    list.add(7)

    expect(list.to_s).to eq "1 --> 2 --> 3 --> 7 --> nil"
  end

  it 'removes a node that exists in the middle of a list' do
    list = create_list [1,2,3]

    list.remove_value(2)

    expect(list.to_s).to eq "1 --> 3 --> nil"
  end
  
  it 'removes a node that exists at the end of a list' do
    list = create_list [1,2]

    list.remove_value(2)

    expect(list.to_s).to eq "1 --> nil"
  end
  
  it 'removes a node that exists at the beginning of a list' do
    list = create_list [1,2]

    list.remove_value(1)

    expect(list.to_s).to eq "2 --> nil"
  end

  it 'does not break when the node is absent' do
    list = create_list [1,2]

    list.remove_value(4)

    expect(list.to_s).to eq "1 --> 2 --> nil"
  end



  # helper methods
  def create_list(items = [])
    list = LinkedList.new
    items.each do |item|
      list.add(item)
    end
    list 
  end

end
