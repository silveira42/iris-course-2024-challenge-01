Class core.log.Order Extends (%Library.Persistent, core.log.Base)
{

ClassMethod Create(pPayload As %Library.String) As core.log.Order
{
	Set obj = ##class(core.log.Order).%New()
	Set obj.Payload = pPayload
	$$$ThrowOnError(obj.%Save())

	Return obj
}

ClassMethod GetLast() As core.log.Order
{
	Set sqlContext = ##class(%SQL.Statement).%ExecDirect(,"CALL core_log.Order_SelectLast()",)

	While sqlContext.%Next(.statusCode)
	{
		$$$ThrowOnError(statusCode)
		Set order = ##class(core.log.Order).%New()
		Set order.Id = sqlContext.%Get("Id")
		Set order.CreatedAt = sqlContext.%Get("CreatedAt")
		Set order.Payload = sqlContext.%Get("Payload")
	}

	Return order
}

ClassMethod ReadByDate(pDateTime As %Library.TimeStamp) As %Library.ListOfObjects
{
	Set sqlContext = ##class(%SQL.Statement).%ExecDirect(,"CALL core_log.Order_SelectByDateGreaterEqual(?)", pDateTime)

	Set orders = ##class(%Collection.ListOfObj).%New()

	While sqlContext.%Next(.statusCode)
	{
		$$$ThrowOnError(statusCode)
		Set order = ##class(core.log.Order).%New()
		Set order.Id = sqlContext.%Get("Id")
		Set order.CreatedAt = sqlContext.%Get("CreatedAt")
		Set order.Payload = sqlContext.%Get("Payload")

		Do orders.Insert(order)
	}

	Return orders
}

Query SelectLast() As %Library.SQLQuery [ SqlProc ]
{
	SELECT TOP 1 Id, CreatedAt, Payload
	FROM core_log.Order
	ORDER BY CreatedAt DESC
}

Query SelectByDateGreaterEqual(pCreatedAt As %Library.TimeStamp) As %Library.SQLQuery [ SqlProc ]
{
	SELECT Id, CreatedAt, Payload
	FROM core_log.Order
	WHERE CreatedAt >= :pCreatedAt
	ORDER BY CreatedAt ASC
}

Storage Default
{
<Data name="OrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CreatedAt</Value>
</Value>
<Value name="3">
<Value>Payload</Value>
</Value>
</Data>
<DataLocation>^core.log.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^core.log.OrderD</IdLocation>
<IndexLocation>^core.log.OrderI</IndexLocation>
<StreamLocation>^core.log.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
