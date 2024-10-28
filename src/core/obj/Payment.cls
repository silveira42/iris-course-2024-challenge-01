Class core.obj.Payment Extends %Library.SerialObject
{

Property CreatedAt As %Library.TimeStamp;

Property Payload As %Library.String;

ClassMethod FromLog(pLog As core.log.Payment) As core.obj.Payment
{
    Set paymentObj = ##class(core.obj.Payment).%New()
    Set paymentObj.Payload = pLog.Payload
    Set paymentObj.CreatedAt = pLog.CratedAt

    Return paymentObj
}

Storage Default
{
<Data name="PaymentState">
<Value name="1">
<Value>CreatedAt</Value>
</Value>
<Value name="2">
<Value>Payload</Value>
</Value>
</Data>
<State>PaymentState</State>
<StreamLocation>^core.obj.PaymentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
