Class core.obj.Order Extends (%Library.SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property Id As %Library.Numeric;

Property CreatedAt As %Library.TimeStamp;

Property Payload As %Library.String(MAXLEN = "");

ClassMethod FromLog(pLog As core.log.Order) As core.obj.Order
{
	Set obj = ##class(core.obj.Order).%New()
	Set obj.Id = pLog.Id
	Set obj.CreatedAt = pLog.CreatedAt
	Set obj.Payload = pLog.Payload

	Return obj
}

Storage Default
{
<Data name="OrderState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>CreatedAt</Value>
</Value>
<Value name="3">
<Value>Payload</Value>
</Value>
</Data>
<State>OrderState</State>
<StreamLocation>^core.obj.OrderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
