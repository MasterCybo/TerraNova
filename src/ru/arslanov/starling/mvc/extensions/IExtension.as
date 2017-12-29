package ru.arslanov.starling.mvc.extensions
{
	public interface IExtension
	{
		function initialize():void;
		function afterInitialize(handler:Function):IExtension;
	}
}
