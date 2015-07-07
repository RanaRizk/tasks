class Node
  #constructor has value of node , term as node , next node of linked list
    attr_accessor :value,:term, :next_node
    def initialize val,term,next_in_line
        @value = val
        @term=term
        @next_node= next_in_line
    end
end
class LinkedList 
    def split(polynomial)
        @coeff = Array.new 
        @power = Array.new 
        @coeff_user=Array.new
        @power_user=Array.new
        #check if first coeff is +ve insert + at first
           if polynomial[0]!="-"
              polynomial="+"+polynomial
          end  
        #replace each + with *+ and each - with *-
          ans=polynomial.include?('-')
          if ans==true
          p=polynomial.gsub!('-', '*-')
          p.gsub!('+', '*+')
          else 
          p=polynomial
          p=p.gsub!('+', '*+')       
          end
#trim whitespace          
p=p.strip()
#split string with *
@terms=p.split("*")
@len=@terms.length

#if user enter 3x >> 3x^1 or 5 >> 5x^0
for p in 1..@len-1
  ans1=['^'].any? { |word|   @terms[p].include?(word)}
ans2=['x'].any? { |word|   @terms[p].include?(word) }
if !ans1 and ans2
   @terms[p]=  @terms[p]+"^1"
end
  if !ans1 and !ans2
      @terms[p]=  @terms[p]+"x^0"
  end
end

@terms= @terms.reject(&:empty?)
@len=@terms.length
 for i in 0..@len-1
           @coeff_user << (@terms[i].split("x^")[0])
           #if found in equation +x replace it with +1x^1 
           if @coeff_user[i]=="+"
            @coeff_user[i]="+1"
          elsif   @coeff_user[i]=="-"
             @coeff_user[i]="-1"
          end
           @power << @terms[i].split("x^")[1]
           @power_user << @terms[i].split("x^")[1]
        end

  
end
def arrange
indexes = Array.new
@coeff=Array.new
#sort desc
@power=@power.sort{|x,y| y <=> x }
for q in 0..@power.length-1
          indexes.push(@power_user.index(@power[q]))
         end
         for g in 0..indexes.length-1
         @coeff.push(@coeff_user[indexes[g]])

         end
       
         
 return @power,@coeff           
end
def create
   

               @nodes = Array.new 
               @full_list= Array.new 
               head=  @coeff[0]+'&'+@power[0]
              
            # create head
             @head = Node.new(head,nil,nil)
               current=@head
                @full_list << current.value

              while current.next_node != nil
              current = current.next_node
              end
              for i in 1..@len-1
              #add nodes to create linked list(polynomial object) , each node is each term`s  (coeff&power)
              @nodes[i]= @coeff[i].to_s+'&'+@power[i].to_s
              current.next_node = Node.new(@nodes[i],nil,nil)   
            #array of nodes
              @full_list << current.next_node.value
             
              end 

return @full_list
        
end
 def evaluate(argument) 
polysum=(@coeff[0].to_i)*((argument.to_i)**(@power[0].to_i))

for t in 1..@coeff.length
  polysum=polysum+(@coeff[t].to_i)*((argument.to_i)**(@power[t].to_i))

end
puts "result is :"
puts polysum

   end
 def equal(power2,coeff2,power1,coeff1)  
if  coeff1==coeff2 
  flag="equal"
else
 flag = "not equal"
  end
puts flag
end
def print
#loop on array of powers and array of coeff

@len=@coeff.length
c=0
str=""
        while c<=@len-1
 str+=@coeff[c].to_s+"x^"+@power[c].to_s

           c+=1
        end
 puts str
end

def add(poly1,poly2)



result= Array.new
c=0
i=0
l=0
solution=""
   while c<=@len-1
result.push(poly1[c].split('&')[0].to_i+ poly2[c].split('&')[0].to_i)
           c+=1
        end

  while l<=@len-1


      if result[l]>0
      result[l]= "+"+result[l].to_s

      end

           l+=1
        end
        # puts result

   while i<=@len-1
solution+=result[i].to_s+"x^" + @full_list[i].split('&')[1].to_s

           i+=1
        end


puts solution

end

def subtract(poly1,poly2)
result= Array.new
c=0
i=0
l=0
solution=""
   while c<=@len-1
result.push(poly1[c].split('&')[0].to_i - poly2[c].split('&')[0].to_i)

           c+=1
  
        end
       

  while l<=@len-1


      if result[l]>0
      result[l]= "+"+result[l].to_s

      end

           l+=1
        end
      
   while i<=@len-1
solution+=result[i].to_s+"x^" + @full_list[i].split('&')[1].to_s

           i+=1
        end


puts solution

end

end
puts "Enter your Polynomial Function"
function=gets
obj=LinkedList.new()
obj2=LinkedList.new()
obj.split(function)
(power1,coeff1)=obj.arrange()
poly1=obj.create()

puts "Enter (1) for evaluate ,(2) for add ,(3) for subtraction,(4) for equality and (5) for print "
choice=gets
option=choice.to_i
if option==1
  puts "Enter value of x"
  x=gets
obj.evaluate(x)



elsif option==2
puts "Enter your 2nd Polynomial Function with same degree and same number of terms "
function2=gets
obj2.split(function2)
(power1,coeff1)=obj2.arrange()

poly2=obj2.create()

obj2.add(poly1,poly2)

  elsif option==3

 
puts "Enter your 2nd Polynomial Function with same degree and same number of terms "
function2=gets
obj2.split(function2)
(power1,coeff1)=obj2.arrange()

poly2=obj2.create()

obj2.subtract(poly1,poly2)
  
elsif option==4
puts "Enter your 2nd Polynomial Function "
function2=gets
obj2.split(function2)
(power2,coeff2)=obj2.arrange()
poly2=obj2.create()
obj2.equal(power2,coeff2,power1,coeff1)

elsif option==5
obj.create()
obj.print()  
end
