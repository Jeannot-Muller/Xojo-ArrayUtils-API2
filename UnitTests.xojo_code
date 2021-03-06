#tag Module
Protected Module UnitTests
	#tag CompatibilityFlags = TargetHasGUI
	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub DetailedErrorIf(errCondition As Boolean, details As String)
		  // Unit testing code calls this function to check if an error has
		  // occurred.  If so, report it to the user and then break into
		  // the debugger so he can do something about it.
		  
		  if not errCondition then return
		  
		  MainWindow.Print "Unit test failure: " + details
		  MessageBox( "Unit test failure." + EndOfLine + EndOfLine + details )
		  
		  
		  break  // OK, now look at the stack to see what went wrong!
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub ErrorIf(errCondition As Boolean)
		  // Unit testing code calls this function to check if an error has
		  // occurred.  If so, report it to the user and then break into
		  // the debugger so he can do something about it.
		  
		  if not errCondition then return
		  
		  Var msg As String
		  msg = "Unit test failure."
		  #if DebugBuild
		    msg = msg + EndOfLine + EndOfLine _
		    + "Click OK to drop into the debugger and examine the stack."
		  #endif
		  MainWindow.Print msg
		  MessageBox( msg )
		  
		  
		  break  // OK, now look at the stack to see what went wrong!
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIfNotEqual(arr1() As Double, arr2() As Double)
		  if arr1.LastIndex <> arr2.LastIndex then
		    ErrorIf true
		    return
		  end if
		  
		  Var i As Integer
		  for i = 0 to arr1.LastIndex
		    ErrorIf arr1(i) <> arr2(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIfNotEqual(actual As Double, expected As Double)
		  DetailedErrorIf Abs(actual - expected) > 1E-12, _
		  "Expected " + str(expected) + ", got " + str(actual) + "."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIfNotEqual(arr1() As Integer, arr2() As Integer)
		  if arr1.LastIndex <> arr2.LastIndex then
		    ErrorIf true
		    return
		  end if
		  
		  Var i As Integer
		  for i = 0 to arr1.LastIndex
		    ErrorIf arr1(i) <> arr2(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIfNotEqual(actual As Integer, expected As Integer)
		  DetailedErrorIf actual <> expected, "Expected " + str(expected) + ", got " + str(actual) + "."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIfNotEqual(arr1() As String, arr2() As String)
		  if arr1.LastIndex <> arr2.LastIndex then
		    ErrorIf true
		    return
		  end if
		  
		  Var i As Integer
		  for i = 0 to arr1.LastIndex
		    ErrorIf arr1(i) <> arr2(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub Run()
		  // Run all our unit tests.
		  
		  TestAdd 
		  TestAverage
		  TestConcat
		  TestClone
		  TestMaxAndMin
		  TestRemoveSlice
		  TestReverse
		  TestSlice
		  TestSplice
		  TestSum
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestAdd()
		  Var iempty() As Integer
		  Var ia() As Integer = Array( 1, 2, 3 )
		  Var ib() As Integer = Array( 4, 5 )
		  Var itest() As Integer
		  
		  itest = iempty.Clone
		  itest.Add iempty
		  ErrorIfNotEqual itest, iempty
		  
		  itest = ia.Clone
		  itest.Add iempty
		  ErrorIfNotEqual itest, ia
		  
		  itest = iempty.Clone
		  itest.Add ia
		  ErrorIfNotEqual itest, ia
		  
		  itest = ia.Clone
		  itest.Add( ib )
		  ErrorIfNotEqual itest, Array( 1, 2, 3, 4, 5 )
		  
		  Var dempty() As Double
		  Var da() As Double = Array( 1.1, 2.2, 3.3 )
		  Var db() As Double = Array( 4.4, 5.5 )
		  Var dtest() As Double
		  
		  dtest = dempty.Clone
		  dtest.Add( dempty )
		  ErrorIfNotEqual dtest, dempty
		  
		  dtest = da.Clone
		  dtest.Add( dempty )
		  ErrorIfNotEqual dtest, da
		  
		  dtest = dempty.Clone
		  dtest.Add( da )
		  ErrorIfNotEqual dtest, da
		  
		  dtest = da.Clone
		  dtest.Add( db )
		  ErrorIfNotEqual dtest, Array( 1.1, 2.2, 3.3, 4.4, 5.5 )
		  
		  
		  Var sempty() As String
		  Var sa() As String = Array( "a", "b", "c" )
		  Var sb() As String = Array( "d", "e" )
		  Var stest() As String
		  
		  stest = sempty.Clone
		  stest.Add( sempty )
		  ErrorIfNotEqual stest, sempty
		  
		  stest = sa.Clone
		  stest.Add( sempty )
		  ErrorIfNotEqual stest, sa
		  
		  stest = sempty.Clone
		  stest.Add( sa )
		  ErrorIfNotEqual stest, sa
		  
		  stest = sa.Clone
		  stest.Add( sb )
		  ErrorIfNotEqual stest, Array( "a", "b", "c", "d", "e" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestAverage()
		  Var iarr() As Integer
		  ErrorIfNotEqual iarr.Average, 0.0
		  
		  iarr = Array(42)
		  ErrorIfNotEqual iarr.Average, 42.0
		  
		  iarr = Array(-5, 5, 3, -3)
		  ErrorIfNotEqual iarr.Average, 0.0
		  
		  iarr = Array(3, 2)
		  ErrorIfNotEqual iarr.Average, 2.5
		  
		  Var darr() As Double
		  ErrorIfNotEqual darr.Average, 0.0
		  
		  darr = Array(40.2)
		  ErrorIfNotEqual darr.Average, 40.2
		  
		  darr = Array(-4.9, 5.1, 3.1, -2.9)
		  ErrorIfNotEqual darr.Average, 0.1
		  
		  darr = Array(3.5, 2.5)
		  ErrorIfNotEqual darr.Average, 3.0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestClone()
		  Var ia() As Integer = Array( 1, 3, 5 )
		  Var ib() As Integer = ia.Clone
		  ErrorIfNotEqual ia, ib
		  ia(0) = 42
		  ErrorIf ib(0) = 42
		  
		  Var da() As Double = Array( 1.1, 3.2, 5.3 )
		  Var db() As Double = da.Clone
		  ErrorIfNotEqual da, db
		  da(0) = 42
		  ErrorIf db(0) = 42
		  
		  Var sa() As String = Array( "a", "b", "c" )
		  Var sb() As String = sa.Clone
		  ErrorIfNotEqual sa, sb
		  sa(0) = "foo"
		  ErrorIf sb(0) = "foo"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestConcat()
		  Var iempty() As Integer
		  Var ia() As Integer = Array( 1, 2, 3 )
		  Var ib() As Integer = Array( 4, 5 )
		  
		  ErrorIfNotEqual iempty.Concat( iempty ), iempty
		  ErrorIfNotEqual ia.Concat( iempty ), ia
		  ErrorIfNotEqual iempty.Concat( ia ), ia
		  ErrorIfNotEqual ia.Concat( ib ), Array( 1, 2, 3, 4, 5 )
		  
		  Var dempty() As Double
		  Var da() As Double = Array( 1.1, 2.2, 3.3 )
		  Var db() As Double = Array( 4.4, 5.5 )
		  
		  ErrorIfNotEqual dempty.Concat( dempty ), dempty
		  ErrorIfNotEqual da.Concat( dempty ), da
		  ErrorIfNotEqual dempty.Concat( da ), da
		  ErrorIfNotEqual da.Concat( db ), Array( 1.1, 2.2, 3.3, 4.4, 5.5 )
		  
		  Var sempty() As String
		  Var sa() As String = Array( "1", "2", "3" )
		  Var sb() As String = Array( "4", "5" )
		  
		  ErrorIfNotEqual sempty.Concat( sempty ), sempty
		  ErrorIfNotEqual sa.Concat( sempty ), sa
		  ErrorIfNotEqual sempty.Concat( sa ), sa
		  ErrorIfNotEqual sa.Concat( sb ), Array( "1", "2", "3", "4", "5" )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestMaxAndMin()
		  
		  Var iarr() As Integer
		  ErrorIfNotEqual iarr.Max, 0
		  ErrorIfNotEqual iarr.Min, 0
		  
		  iarr = Array(42)
		  ErrorIfNotEqual iarr.Max, 42
		  ErrorIfNotEqual iarr.Min, 42
		  
		  iarr = Array(-1, 2, -3, 4, 5)
		  ErrorIfNotEqual iarr.Max, 5
		  ErrorIfNotEqual iarr.Min, -3
		  
		  Var darr() As Double
		  ErrorIfNotEqual darr.Max, 0.0
		  ErrorIfNotEqual darr.Min, 0.0
		  
		  darr = Array(42.0)
		  ErrorIfNotEqual darr.Max, 42.0
		  ErrorIfNotEqual darr.Min, 42.0
		  
		  darr = Array(-1.1, 2.2, -3.3, 4.4, 5.5)
		  ErrorIfNotEqual darr.Max, 5.5
		  ErrorIfNotEqual darr.Min, -3.3
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestRemoveSlice()
		  // Integers...
		  
		  Var ia() As Integer = Array( 10, 11, 12, 13, 14, 15 )
		  Var ib() As Integer = ia.Clone
		  ib.RemoveSlice 1,4  // remove items 1 through 3
		  ErrorIfNotEqual ib, Array( 10, 14, 15 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice 3   // remove from 3 to the end
		  ErrorIfNotEqual ib, Array( 10, 11, 12 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice -2   // remove the last 2 items
		  ErrorIfNotEqual ib, Array( 10, 11, 12, 13 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice -4, -1  // remove the 4th through 2nd items from the end
		  ErrorIfNotEqual ib, Array( 10, 11, 15 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice 0, 1  // remove just the 1st item
		  ErrorIfNotEqual ib, Array( 11, 12, 13, 14, 15 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice -1  // remove just the last item
		  ErrorIfNotEqual ib, Array( 10, 11, 12, 13, 14 )
		  
		  ib = ia.Clone
		  ib.RemoveSlice 2, -3  // remove just item 2 (specified two ways)
		  ErrorIfNotEqual ib, Array( 10, 11, 13, 14, 15 )
		  
		  // Strings...
		  
		  Var sa() As String = Array( "10", "11", "12", "13", "14", "15" )
		  Var sb() As String = sa.Clone
		  sb.RemoveSlice 1,4  // remove items 1 through 3
		  ErrorIfNotEqual sb, Array( "10", "14", "15" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice 3   // remove from 3 to the end
		  ErrorIfNotEqual sb, Array( "10", "11", "12" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice -2   // remove the last 2 items
		  ErrorIfNotEqual sb, Array( "10", "11", "12", "13" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice -4, -1  // remove the 4th through 2nd items from the end
		  ErrorIfNotEqual sb, Array( "10", "11", "15" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice 0, 1  // remove just the 1st item
		  ErrorIfNotEqual sb, Array( "11", "12", "13", "14", "15" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice -1  // remove just the last item
		  ErrorIfNotEqual sb, Array( "10", "11", "12", "13", "14" )
		  
		  sb = sa.Clone
		  sb.RemoveSlice 2, -3  // remove just item 2 (specified two ways)
		  ErrorIfNotEqual sb, Array( "10", "11", "13", "14", "15" )
		  
		  // Doubles...
		  
		  Var da() As Double = Array( 1.0, 1.1, 1.2, 1.3, 1.4, 1.5 )
		  Var db() As Double = da.Clone
		  db.RemoveSlice 1,4  // remove items 1 through 3
		  ErrorIfNotEqual db, Array( 1.0, 1.4, 1.5 )
		  
		  db = da.Clone
		  db.RemoveSlice 3   // remove from 3 to the end
		  ErrorIfNotEqual db, Array( 1.0, 1.1, 1.2 )
		  
		  db = da.Clone
		  db.RemoveSlice -2   // remove the last 2 items
		  ErrorIfNotEqual db, Array( 1.0, 1.1, 1.2, 1.3 )
		  
		  db = da.Clone
		  db.RemoveSlice -4, -1  // remove the 4th through 2nd items from the end
		  ErrorIfNotEqual db, Array( 1.0, 1.1, 1.5 )
		  
		  db = da.Clone
		  db.RemoveSlice 0, 1  // remove just the 1st item
		  ErrorIfNotEqual db, Array( 1.1, 1.2, 1.3, 1.4, 1.5 )
		  
		  db = da.Clone
		  db.RemoveSlice -1  // remove just the last item
		  ErrorIfNotEqual db, Array( 1.0, 1.1, 1.2, 1.3, 1.4 )
		  
		  db = da.Clone
		  db.RemoveSlice 2, -3  // remove just item 2 (specified two ways)
		  ErrorIfNotEqual db, Array( 1.0, 1.1, 1.3, 1.4, 1.5 )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestReverse()
		  Var sa() As String = Array( "a" )
		  sa.Reverse
		  ErrorIfNotEqual sa, Array( "a" )
		  
		  sa() = Array( "a", "b" )
		  sa.Reverse
		  ErrorIfNotEqual sa, Array( "b", "a" )
		  
		  sa() = Array( "a", "b", "c" )
		  sa.Reverse
		  ErrorIfNotEqual sa, Array( "c", "b", "a" )
		  
		  sa() = Array( "a", "b", "c", "d" )
		  sa.Reverse
		  ErrorIfNotEqual sa, Array( "d", "c", "b", "a" )
		  
		  
		  Var da() As Double = Array( 1.1 )
		  da.Reverse
		  ErrorIfNotEqual da, Array( 1.1 )
		  
		  da() = Array( 1.1, 2.2 )
		  da.Reverse
		  ErrorIfNotEqual da, Array( 2.2, 1.1 )
		  
		  da() = Array( 1.1, 2.2, 3.3 )
		  da.Reverse
		  ErrorIfNotEqual da, Array( 3.3, 2.2, 1.1 )
		  
		  da() = Array( 1.1, 2.2, 3.3, 4.4 )
		  da.Reverse
		  ErrorIfNotEqual da, Array( 4.4, 3.3, 2.2, 1.1 )
		  
		  
		  Var ia() As Integer = Array( 1 )
		  ia.Reverse
		  ErrorIfNotEqual ia, Array( 1 )
		  
		  ia() = Array( 1, 2 )
		  ia.Reverse
		  ErrorIfNotEqual ia, Array( 2, 1 )
		  
		  ia() = Array( 1, 2, 3 )
		  ia.Reverse
		  ErrorIfNotEqual ia, Array( 3, 2, 1 )
		  
		  ia() = Array( 1, 2, 3, 4 )
		  ia.Reverse
		  ErrorIfNotEqual ia, Array( 4, 3, 2, 1 )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSlice()
		  Var ia() As Integer = Array( 1, 2, 3, 4, 5 )
		  ErrorIfNotEqual ia.Slice(2), Array( 3, 4, 5 )
		  ErrorIfNotEqual ia.Slice(-2), Array( 4, 5 )
		  ErrorIfNotEqual ia.Slice(0, 2), Array( 1, 2 )
		  ErrorIfNotEqual ia.Slice, ia
		  ErrorIfNotEqual ia.Slice(0, -3), Array( 1, 2 )
		  
		  Var da() As Double = Array( 1.1, 2.2, 3.3, 4.4, 5.5 )
		  ErrorIfNotEqual da.Slice(2), Array( 3.3, 4.4, 5.5 )
		  ErrorIfNotEqual da.Slice(-2), Array( 4.4, 5.5 )
		  ErrorIfNotEqual da.Slice(0, 2), Array( 1.1, 2.2 )
		  ErrorIfNotEqual da.Slice, da
		  ErrorIfNotEqual da.Slice(0, -3), Array( 1.1, 2.2 )
		  
		  Var sa() As String = Array( "a", "b", "c", "d", "e" )
		  ErrorIfNotEqual sa.Slice(2), Array( "c", "d", "e" )
		  ErrorIfNotEqual sa.Slice(-2), Array( "d", "e" )
		  ErrorIfNotEqual sa.Slice(0, 2), Array( "a", "b" )
		  ErrorIfNotEqual sa.Slice, sa
		  ErrorIfNotEqual sa.Slice(0, -3), Array( "a", "b" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSplice()
		  Var ia() As Integer = Array(0,1,2,3,4,5)
		  Var ib() As Integer = Array(10,11,12)
		  
		  ia.Splice 2,4, ib
		  ErrorIfNotEqual ia, Array(0, 1, 10, 11, 12, 4, 5)
		  
		  ia = Array(0,1,2,3,4,5)
		  ia.Splice 2,4, ib, -2
		  ErrorIfNotEqual ia, Array(0, 1, 11, 12, 4, 5)
		  
		  ia = Array(0,1,2,3,4,5)
		  ia.Splice 2,3, ib
		  ErrorIfNotEqual ia, Array(0, 1, 10, 11, 12, 3, 4, 5)
		  
		  ia = Array(0,1,2,3,4,5)
		  ia.Splice 2,2, ib
		  ErrorIfNotEqual ia, Array(0, 1, 10, 11, 12, 2, 3, 4, 5)
		  
		  Var da() As Double = Array(0.0,1,2,3,4,5)
		  Var db() As Double = Array(1.0,1.1,1.2)
		  
		  da.Splice 2,4, db
		  ErrorIfNotEqual da, Array(0, 1, 1.0, 1.1, 1.2, 4, 5)
		  
		  da = Array(0.0,1,2,3,4,5)
		  da.Splice 2,4, db, -2
		  ErrorIfNotEqual da, Array(0, 1, 1.1, 1.2, 4, 5)
		  
		  da = Array(0.0,1,2,3,4,5)
		  da.Splice 2,3, db
		  ErrorIfNotEqual da, Array(0, 1, 1.0, 1.1, 1.2, 3, 4, 5)
		  
		  da = Array(0.0,1,2,3,4,5)
		  da.Splice 2,2, db
		  ErrorIfNotEqual da, Array(0, 1, 1.0, 1.1, 1.2, 2, 3, 4, 5)
		  
		  Var sa() As String = Array("a","b","c","d","e","f")
		  Var sb() As String = Array("foo","bar","baz")
		  
		  sa.Splice 2,4, sb
		  ErrorIfNotEqual sa, Array("a", "b", "foo", "bar", "baz", "e", "f")
		  
		  sa = Array("a","b","c","d","e","f")
		  sa.Splice 2,4, sb, -2
		  ErrorIfNotEqual sa, Array("a", "b", "bar", "baz", "e", "f")
		  
		  sa = Array("a","b","c","d","e","f")
		  sa.Splice 2,3, sb
		  ErrorIfNotEqual sa, Array("a", "b", "foo", "bar", "baz", "d", "e", "f")
		  
		  sa = Array("a","b","c","d","e","f")
		  sa.Splice 2,2, sb
		  ErrorIfNotEqual sa, Array("a", "b", "foo", "bar", "baz", "c", "d", "e", "f")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSum()
		  
		  Var iarr() As Integer
		  ErrorIfNotEqual iarr.Total, 0
		  
		  iarr = Array(42)
		  ErrorIfNotEqual iarr.Total, 42
		  
		  iarr = Array(-1, 2, -3, 4, 5)
		  ErrorIfNotEqual iarr.Total, 7
		  
		  Var darr() As Double
		  ErrorIfNotEqual darr.Total, 0.0
		  
		  darr = Array(42.0)
		  ErrorIfNotEqual darr.Total, 42.0
		  
		  darr = Array(-1.1, 2.2, -3.3, 4.4, 5.5)
		  ErrorIfNotEqual darr.Total, 7.7
		  
		End Sub
	#tag EndMethod


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
