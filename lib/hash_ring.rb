#
#--
# Copyright (c) 2009, Mitchell Hashimoto, mitchell.hashimoto@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#++
#

require 'digest/md5'

# TODO: RDOC
class HashRing
  #
  # Creates a HashRing instance
  #
  # == parameters
  #
  #   * nodes - A list of objects which have a proper to_s representation.
  #   * weights - A hash (dictionary, not to be mixed up with HashRing)
  #       which sets weights to the nodes. The default weight is that all
  #       nodes have equal weight.
  def initialize(nodes=nil, weights=nil)
    @ring = {}
    @_sorted_keys = []

    @nodes = nodes

    weights = {} if weights.nil?
    
    @weights = weights

    self._generate_circle()
  end

  #
  # Generates the circle
  def _generate_circle
    total_weight = 0
    
    @nodes.each do |node|
      total_weight += @weights[node] || 1
    end

    @nodes.each do |node|
      weight = @weights[node] || 1
      factor = ((40 * @nodes.length * weight) / total_weight.to_f).floor.to_i

      factor.times do |j|
        b_key = self._hash_digest("#{node}-#{j}")

        3.times do |i|
          key = self._hash_val(b_key) { |x| x+(i*4) }
          @ring[key] = node
          @_sorted_keys.push(key)
        end
      end
    end

    @_sorted_keys.sort!
  end

  def sorted_keys; @_sorted_keys; end

  def _hash_val(b_key, &block)
    return ((b_key[block.call(3)] << 24) | 
            (b_key[block.call(2)] << 16) | 
            (b_key[block.call(1)] << 8) | 
            (b_key[block.call(0)]))
  end

  #
  # Returns raw MD5 digest given a key
  def _hash_digest(key)
    m = Digest::MD5.new
    m.update(key)

    # No need to ord each item since ordinary array access
    # of a string in Ruby converts to ordinal value
    return m.digest
  end
end
