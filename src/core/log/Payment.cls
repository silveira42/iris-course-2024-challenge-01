Class core.log.Payment Extends core.log.Base
{

ClassMethod Create(pPayload As %Library.String) As core.log.Payment
{
    // Todo: Adicionar validação do formato do payload

    Set newLog = ##class(core.log.Payment).%New()
    Set newLog.Payload = pPayload
    $$$ThrowOnError(newLog.%Save())

    Return newLog
}

ClassMethod ReadByDate(pDateTime As %Library.TimeStamp) As %Collection.ListOfObj
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
Query SelectByDateGreaterEqual(pDateTime As %Library.TimeStamp) As %Library.SQLQuery [ SqlProc ]
{
    SELECT Id, CreatedAt, Payload
    FROM core_log.Payment
    WHERE CreatedAt >= :pDateTime
    ORDER BY CreatedAt ASC
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
