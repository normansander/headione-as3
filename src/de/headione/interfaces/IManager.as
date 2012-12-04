package de.headione.interfaces {
	/**
	 * @author Jens Kabisch (2010)
	 */
	public interface IManager {

		function show() : void;

		function hide() : void;

		function dispose() : void;

		function freeze() : void;

		function unfreeze() : void;
	}
}
