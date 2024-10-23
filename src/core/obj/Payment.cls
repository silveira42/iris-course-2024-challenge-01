Class core.obj.Payment Extends %SerialObject
{

Property CreatedAt As %TimeStamp;

Property Payload As %String;

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
