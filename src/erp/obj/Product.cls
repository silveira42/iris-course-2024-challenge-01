Class erp.obj.Product Extends (%Library.SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property ProductId As %Library.String(%JSONFIELDNAME = "productId", MAXLEN = 50) [ Required ];

Property Quantity As %Library.Integer(%JSONFIELDNAME = "quantity");

Property Price As %Library.Float(%JSONFIELDNAME = "price");

Storage Default
{
<Data name="ProductState">
<Value name="1">
<Value>ProductId</Value>
</Value>
<Value name="2">
<Value>Quantity</Value>
</Value>
<Value name="3">
<Value>Price</Value>
</Value>
</Data>
<State>ProductState</State>
<StreamLocation>^erp.obj.ProductS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
