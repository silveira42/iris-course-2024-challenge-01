Class core.log.Payment Extends %Persistent
{

Property CreatedAt As %TimeStamp;

Property Payload As %String;

ClassMethod Create(pPayload As %String) As core.log.Payment
{
    Set newLog = ##class(core.log.Payment).%New()
    Set newLog.Payload = pPayload
    $$$ThrowOnError(newLog.%Save())

    Return newLog
}

ClassMethod ReadByDate(pDateTime As %TimeStamp) As %Collection.ListOfObj
{
    Set sqlContext = ##Class(%SQL.Statement).%ExecDirect(,"CALL core_log.Payment_SelectByDateGreaterEqual(?)", pDateTime)

    Set payments = ##class(%Collection.ListOfObj).%New()

    While (sqlContext.%Next(.statusCode))
    {
        If ($SYSTEM.Status.IsError(statusCode))
        {
            Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        }

        Set payment = ##class(core.log.Payment).%OpenId(sqlContext.%ID())

        Do payments.Insert(payment)
    }
}

/// Description
Query SelectByDateGreaterEqual(pDateTime As %TimeStamp) As %SQLQuery [ SqlProc ]
{
    SELECT Id, CreatedAt, Payload
    FROM core_log.Payment
    WHERE CreatedAt >= :pDateTime
    ORDER BY CreatedAt ASC
}

Storage Default
{
<Data name="PaymentDefaultData">
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
<DataLocation>^core.log.PaymentD</DataLocation>
<DefaultData>PaymentDefaultData</DefaultData>
<IdLocation>^core.log.PaymentD</IdLocation>
<IndexLocation>^core.log.PaymentI</IndexLocation>
<StreamLocation>^core.log.PaymentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
