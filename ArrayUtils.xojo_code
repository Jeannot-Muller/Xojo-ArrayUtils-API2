#tag Module
Protected Module ArrayUtils
	#tag Method, Flags = &h0
		Sub Add(Extends arr() As Double, arr2() As Double)
		  // Concatenate arr2 to arr.
		  
		  Var ub2 As Integer = arr2.LastIndex
		  if ub2 < 0 then return
		  
		  Var base As Integer = arr.count
		  ReDim arr( base + ub2 )
		  
		  Var index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub add(Extends arr() As Integer, arr2() As Integer)
		  // Concatenate arr2 to arr.
		  
		  Var ub2 As Integer = arr2.LastIndex
		  if ub2 < 0 then return
		  
		  Var base As Integer = arr.count
		  ReDim arr( base + ub2 )
		  
		  Var index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub add(Extends arr() As String, arr2() As String)
		  // Concatenate arr2 to arr.
		  
		  Var ub2 As Integer = arr2.LastIndex
		  if ub2 < 0 then return
		  
		  Var base As Integer = arr.count
		  ReDim arr( base + ub2 )
		  
		  Var index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Average(Extends arr() As Double) As Double
		  // Return the arithmetic mean of the values in the array.
		  Var item, sum As Double
		  for each item in arr
		    sum = sum + item
		  next
		  return sum / ( arr.count )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Average(Extends arr() As Integer) As Double
		  // Return the arithmetic mean of the values in the array.
		  Var item, sum As Integer
		  for each item in arr
		    sum = sum + item
		  next
		  return sum / ( arr.count)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As Double) As Double()
		  // Return an independent copy of this array.
		  
		  Var out() As Double
		  Var ub As Integer = arr.LastIndex
		  if ub >= 0 then
		    ReDim out( ub )
		    Var index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As Integer) As Integer()
		  // Return an independent copy of this array.
		  
		  Var out() As Integer
		  Var ub As Integer = arr.LastIndex
		  if ub >= 0 then
		    ReDim out( ub )
		    Var index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As String) As String()
		  // Return an independent copy of this array.
		  
		  Var out() As String
		  Var ub As Integer = arr.LastIndex
		  if ub >= 0 then
		    ReDim out( ub )
		    Var index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() As Double, arr2() As Double) As Double()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Var out() As Double
		  Var ub1 As Integer = arr1.LastIndex
		  Var ub2 As Integer = arr2.LastIndex
		  ReDim out( ub1 + ub2 + 1 )
		  Var index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() As Integer, arr2() As Integer) As Integer()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Var out() As Integer
		  Var ub1 As Integer = arr1.LastIndex
		  Var ub2 As Integer = arr2.LastIndex
		  ReDim out( ub1 + ub2 + 1 )
		  Var index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() As String, arr2() As String) As String()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Var out() As String
		  Var ub1 As Integer = arr1.LastIndex
		  Var ub2 As Integer = arr2.LastIndex
		  ReDim out( ub1 + ub2 + 1 )
		  Var index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max(Extends arr() As Double) As Double
		  // Return the greatest of the items in the array, or 0 for an empty array.
		  Var index, ub As Integer
		  Var out As Double
		  ub = arr.LastIndex
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) > out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max(Extends arr() As Integer) As Integer
		  // Return the greatest of the items in the array, or 0 for an empty array.
		  Var index, ub As Integer
		  Var out As Integer
		  ub = arr.LastIndex
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) > out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Min(Extends arr() As Double) As Double
		  // Return the least of the items in the array, or 0 for an empty array.
		  Var index, ub As Integer
		  Var out As Double
		  ub = arr.LastIndex
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) < out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Min(Extends arr() As Integer) As Integer
		  // Return the least of the items in the array, or 0 for an empty array.
		  Var index, ub As Integer
		  Var out As Integer
		  ub = arr.LastIndex
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) < out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As Double, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex > toIndex - 1 then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just ReDim and be done
		  if toIndex - 1 = ub then
		    ReDim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Arary.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.RemoveAt( fromIndex )
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Var dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  ReDim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As Integer, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex >= toIndex then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just ReDim and be done
		  if toIndex - 1 = ub then
		    ReDim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Array.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.RemoveAt( fromIndex )
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Var dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  ReDim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As String, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex > toIndex - 1 then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just ReDim and be done
		  if toIndex -1 = ub then
		    ReDim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Arary.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.RemoveAt( fromIndex )
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Var dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  ReDim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() As Double)
		  // Reverse the order of the elements in the array, in place.
		  
		  Var low, high, midpoint As Integer
		  high = arr.LastIndex
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Var temp As Double = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() As Integer)
		  // Reverse the order of the elements in the array, in place.
		  
		  Var low, high, midpoint As Integer
		  high = arr.LastIndex
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Var temp As Integer = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() As String)
		  // Reverse the order of the elements in the array, in place.
		  
		  Var low, high, midpoint As Integer
		  high = arr.LastIndex
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Var temp As String = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As Double, fromIndex As Integer = 0, toIndex As Integer = 0) As Double()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Var out() As Double
		  Var outbound As Integer = toIndex - fromIndex - 1
		  ReDim out( outbound )
		  Var index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As Integer, fromIndex As Integer = 0, toIndex As Integer = 0) As Integer()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Var out() As Integer
		  Var outbound As Integer = toIndex - fromIndex - 1
		  ReDim out( outbound )
		  Var index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As String, fromIndex As Integer = 0, toIndex As Integer = 0) As String()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Var out() As String
		  Var outbound As Integer = toIndex - fromIndex - 1
		  ReDim out( outbound )
		  Var index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As Double, fromIndex As Integer, toIndex As Integer, arrayToInsert() As Double, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Var srcub As Integer = arrayToInsert.LastIndex
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Var qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Var qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Var roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Var srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.AddAt( destPos, arrayToInsert( srcPos ) )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As Integer, fromIndex As Integer, toIndex As Integer, arrayToInsert() As Integer, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Var srcub As Integer = arrayToInsert.LastIndex
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Var qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Var qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Var roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Var srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.AddAt( destPos, arrayToInsert( srcPos ) )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As String, fromIndex As Integer, toIndex As Integer, arrayToInsert() As String, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Var ub As Integer = arr.LastIndex
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Var srcub As Integer = arrayToInsert.LastIndex
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Var qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Var qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Var roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Var srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.AddAt( destPos, arrayToInsert( srcPos ) )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Total(Extends arr() As Double) As Double
		  // Return the total sum of the items in the array.
		  Var item, out As Double
		  for each item in arr
		    out = out + item
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Total(Extends arr() As Integer) As Integer
		  // Return the total sum of the items in the array.
		  Var item, out As Integer
		  for each item in arr
		    out = out + item
		  next
		  return out
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Change History
		2006-JAN-03:
		- Initial release.
		
		2006-JAN-16:
		- Changed the meaning of the second slice index on Slice and RemoveSlice,
		  since careful thought about Splice pointed out how the previous meaning was wrong
		  and Guido van Rossum, as usual, was quite right.  See "Slice Indexing" note.
		- Renamed AppendArray to Append (this works fine as of RB2006R1).
		- Finished the Splice and Append methods.
		
		2006-JAN-31:
		- Added the Concat method.
		- Added the Reverse method.
		
		2020-DEC-27:
		- Renamed Append to Add 
		- Conversion to API2
		
		2020-DEC-29:
		- Feedback from Robert Livingston implemented: 
		  "arr.LastIndex + 1" replaced by "arr.count"
		
	#tag EndNote

	#tag Note, Name = Contributors
		
		Many people have contributed to the development of this module, including:
		
		Joe Strout, joe@strout.net 
		Jeannot Muller, dr@jeannot-muller.com (*)
		Robert Livingston 
		
		(*) To whom correspondence should be addressed.
		
		
	#tag EndNote

	#tag Note, Name = Home Page
		
		This StringUtils module in the API Version 2 is maintained by TECcompanion GmbH.
		The current administrative contact for it is Jeannot Muller (jeannot-muller.com).
		You should be able to find the latest version via this URL:
		
		    https://jeannot-muller.com/ 
		
		        and on GitHub: 
		
		    https://github.com/Jeannot-Muller/Xojo-ArrayUtils-API2
		
		
	#tag EndNote

	#tag Note, Name = License
		
		This StringUtils module is in the public domain.  You may use it for any purpose
		whatsoever, but it comes with no express or implied warranty of correctness or
		fitness for any purpose.
		
		Share and enjoy!
		
		
	#tag EndNote

	#tag Note, Name = Slice Indexing
		Several of the methods in this module take two indexes to specify a subset
		off an array.  Such a subset is called a "slice" and is involved in methods
		such as RemoveSlice, Slice, and Splice.
		
		In such cases, the first index specifies the first element in the slice.  It may
		be either an ordinary, non-negative index, in which case 0 means the first
		element of the array, 1 means the second element, and so on.  Or it may be
		a negative number, in which case we count from the end of the array; -1 is
		the last element, -2 is the next-to-last, and so on.
		
		The second index specifies the element AFTER the last one to be included
		in the slice.  Again this may be positive or negative, but 0 in this case means
		one past the end of the array.
		
		This indexing scheme seems a bit odd at first (unless you are familiar with
		Python), but it has a lot of advantages.  Suppose you have an array 'a' with
		five elements.  Then you have:
		
		  a.Slice(0,0) is the entire array
		  a.Slice(0,-1) is all but the last element
		  a.Slice(1,0) is all but the first element
		  a.Slice(0,2) is the first two elements
		  a.Slice(2,0) is everything except the first two elements
		
		Indeed, you can generalize and note that a.Slice(0,n).Concat( a.Slice(n,0) )
		always comes out equal to n.  Another advantage is that if you have a loop,
		where either the first index is counting down to 0 or the last index is 
		counting up (from negative numbers) to 0, it will do the right thing in the
		boundary cases (i.e. when the counter hits 0).
		
		  
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
