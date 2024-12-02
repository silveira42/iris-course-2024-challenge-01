Class core.log.Base [ Abstract ]
{

Property CreatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property Payload As %Library.String(MAXLEN = "");

ClassMethod Create(pPayload As %Library.String) As core.log.Base
{
	Return $$$ERROR($$$NotImplemented)
}

ClassMethod GetLast() As core.log.Base
{
	Return $$$ERROR($$$NotImplemented)
}

ClassMethod ReadByDate(pDateTime As %Library.TimeStamp) As %Library.ListOfObjects
{
	Return $$$ERROR($$$NotImplemented)
}

}
