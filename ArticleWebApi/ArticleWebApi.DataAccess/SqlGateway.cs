using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace ArticleWebApi.DataAccess
{
    public class SqlGateway
    {
        private readonly IConfiguration config;

        public SqlGateway(IConfiguration config)
        {
            this.config = config;
        }

        public T QueryFirst<T>(string commandText, object parameters)
        {
            CommandDefinition commandDefinition = this.GetCommandDefinition(commandText, parameters);
            using (IDbConnection connection = this.GetOpenDbConnection())
            {
                return connection.QueryFirstOrDefault<T>(commandDefinition);
            }
        }

        public IList<T> Fetch<T>(string commandText, object parameters)
        {
            CommandDefinition commandDefinition = this.GetCommandDefinition(commandText, parameters);
            using (IDbConnection connection = this.GetOpenDbConnection())
            {
                return connection.Query<T>(commandDefinition).AsList();
            }
        }

        public IList<T> Fetch<T>(string commandText)
        {
            using (IDbConnection connection = this.GetOpenDbConnection())
            {
                return connection.Query<T>(commandText).AsList();
            }
        }

        public int Execute(string commandText, object parameters)
        {
            CommandDefinition commandDefinition = this.GetCommandDefinition(commandText, parameters);
            using (IDbConnection connection = this.GetOpenDbConnection())
            {
                return connection.Execute(commandDefinition);
            }
        }

        public T ExecuteScalar<T>(string commandText, object parameters)
        {
            CommandDefinition commandDefinition = this.GetCommandDefinition(commandText, parameters);
            using (IDbConnection connection = this.GetOpenDbConnection())
            {
                return connection.ExecuteScalar<T>(commandDefinition);
            }
        }

        private CommandDefinition GetCommandDefinition(string commandText, object parameters)
        {
            return new CommandDefinition(
                commandText: commandText,
                parameters: parameters,
                transaction: null,
                commandTimeout: 10,
                commandType: CommandType.Text,
                flags: CommandFlags.Buffered | CommandFlags.Pipelined);
        }

        private IDbConnection GetOpenDbConnection()
        {
            var connection = new SqlConnection(config.GetConnectionString("DefaultConnection"));
            connection.Open();
            return connection;
        }
    }
}
