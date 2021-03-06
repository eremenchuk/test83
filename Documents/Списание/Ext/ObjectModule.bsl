
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	Движения.ОстаткиТоваров.Очистить();
	
	//Остатки
	Для каждого СтрокаТоваров Из Товары Цикл
		НовоеДвижение = Движения.ОстаткиТоваров.Добавить();
		НовоеДвижение.ВидДвижения = ВидДвиженияНакопления.Расход;
		НовоеДвижение.Период = Дата;
		НовоеДвижение.Товар = СтрокаТоваров.Товар;
		НовоеДвижение.Склад = Склад;
		НовоеДвижение.Количество = СтрокаТоваров.Количество;
	КонецЦикла;
	
	//Движения.ОстаткиТоваров.БлокироватьДляИзменения = Истина;
	Движения.ОстаткиТоваров.Записать();
	
	//Движения.Записать();
	
	//Контроль остатков
	ТекстЗапроса = "ВЫБРАТЬ
	               |	Списание.НомерСтроки,
	               |	Списание.Товар КАК Товар,
	               |	Списание.Количество
	               |ПОМЕСТИТЬ ВТСписание
	               |ИЗ
	               |	Документ.Списание.Товары КАК Списание
	               |ГДЕ
	               |	Списание.Ссылка = &Ссылка
	               |
	               |ИНДЕКСИРОВАТЬ ПО
	               |	Товар
	               |;
	               |
	               |////////////////////////////////////////////////////////////////////////////////
	               |ВЫБРАТЬ
	               |	ОстаткиТоваров.Товар,
	               |	ОстаткиТоваров.КоличествоОстаток КАК КоличествоОстаток
	               |ИЗ
	               |	РегистрНакопления.ОстаткиТоваров.Остатки(
	               |				&Период,
	               |				Склад = &Склад
				   |					И Товар В
				   |						(ВЫБРАТЬ
				   |							ВТСписание.Товар
				   |						ИЗ
				   |							ВТСписание)
	               |) КАК ОстаткиТоваров
	               |ГДЕ ОстаткиТоваров.КоличествоОстаток < 0";
	Запрос = Новый Запрос(ТекстЗапроса);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.УстановитьПараметр("Период", Новый Граница(МоментВремени(), ВидГраницы.Включая));
	//Запрос.УстановитьПараметр("Период", Дата);
	Запрос.УстановитьПараметр("Склад", Склад);
	Результат = Запрос.Выполнить();
	Если НЕ Результат.Пустой() Тогда
		Выборка = Результат.Выбрать();
		Пока Выборка.Следующий() Цикл
			//Сообщить(СтрШаблон("На складе %1 нехватает остатка товара %2 (имеется %3, необходимо %4)", Склад, Выборка.Товар, Выборка.КоличествоОстаток, Выборка.Количество));
			Сообщить("На складе " + Склад + " нехватает остатка товара " + Выборка.Товар + " (нехватило " + Выборка.КоличествоОстаток + ")");
			Отказ = Истина;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры
